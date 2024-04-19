import 'package:flutter/material.dart';
import 'package:taskem/src/core/extensions/context_extension.dart';
import 'package:taskem/src/core/extensions/theme_extension.dart';
import 'package:taskem/src/core/helpers/dimension.dart';
import 'package:taskem/src/core/helpers/throttler.dart';
import 'package:taskem/src/core/widgets/custom_text_field.dart';
import 'package:taskem/src/features/shared/model/user_info_model.dart';

class UserExpandedDownButton extends StatefulWidget {
  const UserExpandedDownButton({
    required this.items,
    required this.onChanged,
    this.onTap,
    this.chosenEntity,
    super.key,
  });

  final List<UserInfoModel> items;
  final UserInfoModel? chosenEntity;
  final void Function(UserInfoModel value) onChanged;
  final void Function(bool isOpen)? onTap;

  @override
  State<UserExpandedDownButton> createState() => _UserExpandedDownButtonState();
}

class _UserExpandedDownButtonState extends State<UserExpandedDownButton>
    with SingleTickerProviderStateMixin {
  UserInfoModel? chosenEntity;
  late ValueNotifier<List<UserInfoModel>> itemList;
  late AnimationController controller;
  late Animation<double> animation;
  late TextEditingController textEditingController;
  late ScrollController scrollController;
  late final ValueNotifier<bool> isOpen;
  final itemHeight = 60.0;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    textEditingController = TextEditingController();

    scrollController = ScrollController();

    isOpen = ValueNotifier(false);

    itemList = ValueNotifier(widget.items);
    textEditingController.addListener(
      () {
        Future.delayed(
          const Duration(microseconds: 1),
          () {
            final findList = widget.items
                .where(
                  (element) =>
                      element.userName
                          .toLowerCase()
                          .contains(textEditingController.text.toLowerCase()) ||
                      textEditingController.text
                          .toLowerCase()
                          .contains(element.userName.toLowerCase()),
                )
                .toList();
            final list = widget.items.toList();
            for (var i = 0; i < findList.length; i++) {
              list.remove(findList[i]);
            }
            findList.addAll(list);
            itemList.value = findList;
          },
        );
      },
    );
    animation = Tween<double>(begin: 0, end: 1).animate(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    itemList.dispose();
    isOpen.dispose();
    super.dispose();
  }

  void iconAnimation() {
    isOpen.value ? controller.forward() : controller.reverse();
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOutCirc,
    );
  }

  double calculateExpandedHeight(int itemsCount) {
    if (itemsCount > 3) {
      return itemHeight * 3;
    }
    return itemHeight * itemsCount;
  }

  void onTap() {
    isOpen.value = isKeyboardOpen();
    if (!isKeyboardOpen() && !isOpen.value) {
      isOpen.value = true;
    }
    iconAnimation();
  }

  void onIconTap() {
    Throttler(
      duration: const Duration(milliseconds: 200),
    ).run(() {
      isOpen.value = !isOpen.value;
      iconAnimation();
      FocusScope.of(context).unfocus();
    });
  }

  void onItemTap(UserInfoModel entity) {
    setState(
      () {
        chosenEntity = entity;
        isOpen.value = false;
        widget.onChanged(entity);
        textEditingController
          ..text = entity.userName
          ..selection = TextSelection.fromPosition(
            TextPosition(
              offset: textEditingController.text.length,
            ),
          );
        iconAnimation();
        FocusScope.of(context).unfocus();
      },
    );
  }

  bool isKeyboardOpen() => View.of(context).viewInsets.bottom != 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = context.theme;
    final fillColor = theme.isDark ? const Color(0xFF313131) : Colors.white;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            color: fillColor,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: CustomTextField(
                    canBeEmpty: true,
                    controller: textEditingController,
                    onTap: () {
                      widget.onTap?.call(isOpen.value);
                      onTap();
                    },
                  ),
                ),
                IconButton(
                  icon: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    size: 18,
                    progress: animation,
                  ),
                  onPressed: onIconTap,
                ),
              ],
            ),
          ),
        ),
        Flexible(
          child: ValueListenableBuilder(
            valueListenable: isOpen,
            builder: (context, value, _) {
              return AnimatedContainer(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(Dimension.borderRadius),
                    bottomRight: Radius.circular(Dimension.borderRadius),
                  ),
                  color: fillColor,
                ),
                constraints: BoxConstraints(
                  maxHeight: isOpen.value
                      ? calculateExpandedHeight(widget.items.length)
                      : 0,
                ),
                curve: Curves.fastEaseInToSlowEaseOut,
                duration: const Duration(milliseconds: 300),
                child: AnimatedOpacity(
                  opacity: isOpen.value ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: Scrollbar(
                    child: ValueListenableBuilder(
                      valueListenable: itemList,
                      builder: (context, value, child) => CustomScrollView(
                        physics: const ClampingScrollPhysics(),
                        controller: scrollController,
                        slivers: [
                          SliverList.builder(
                            itemCount: value.length,
                            itemBuilder: (context, index) => Material(
                              color: Colors.transparent,
                              child: SizedBox(
                                height: itemHeight,
                                child: Padding(
                                  padding: const EdgeInsets.all(6).copyWith(
                                    bottom: index != value.length - 1 ? 0 : 6,
                                  ),
                                  child: TextButton(
                                    onPressed: () => onItemTap(value[index]),
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: index == 0
                                        ? Text(
                                            value[index].userName,
                                            overflow: TextOverflow.fade,
                                          )
                                        : Text(
                                            value[index].userName,
                                            style: TextStyle(
                                              color: Colors.grey.shade500,
                                            ),
                                            overflow: TextOverflow.fade,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
