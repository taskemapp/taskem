import 'package:flutter/material.dart';
import 'package:taskem/src/core/extensions/context_extension.dart';
import 'package:taskem/src/core/extensions/theme_extension.dart';
import 'package:taskem/src/core/helpers/animation_config.dart';
import 'package:taskem/src/core/helpers/dimension.dart';
import 'package:taskem/src/core/helpers/throttler.dart';
import 'package:taskem/src/core/widgets/custom_text_field.dart';

@immutable
class ExpandedDownField<T> extends StatefulWidget {
  ExpandedDownField({
    required this.items,
    required this.onChanged,
    required this.suggestionFilter,
    required this.itemBuilder,
    this.showedItems = 3,
    this.itemHeight = 60,
    this.onTap,
    super.key,
  });

  final List<T> items;

  final String? Function(T value) onChanged;

  final double itemHeight;
  final double showedItems;

  final Widget Function(
    BuildContext context,
    int index,
    List<T> items,
  ) itemBuilder;

  final List<T> Function(String search) suggestionFilter;

  final void Function(bool isOpen)? onTap;

  Color? fillColor;

  @override
  State<ExpandedDownField<T>> createState() => _ExpandedDownFieldState();
}

class _ExpandedDownFieldState<T> extends State<ExpandedDownField<T>>
    with SingleTickerProviderStateMixin {
  late ValueNotifier<List<T>> itemList;
  late AnimationController controller;
  late Animation<double> animation;
  late TextEditingController textEditingController;
  late ScrollController scrollController;
  late final ValueNotifier<bool> isOpen;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: AnimationConfig.duration,
      reverseDuration: AnimationConfig.reverseDuration,
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
            final findList =
                widget.suggestionFilter(textEditingController.text);
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
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: AnimationConfig.curve,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    textEditingController.dispose();
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
    if (itemsCount > widget.showedItems) {
      return widget.itemHeight * widget.showedItems;
    }
    return widget.itemHeight * itemsCount;
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

  void onItemTap(T entity) {
    setState(
      () {
        final text = widget.onChanged(entity);
        if (text != null) {
          textEditingController.text = text;
        }
        isOpen.value = false;
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
    final fillColor = widget.fillColor ??=
        theme.isDark ? const Color(0xFF313131) : Colors.white;

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
                  child: ValueListenableBuilder(
                    valueListenable: itemList,
                    builder: (context, value, child) => Scrollbar(
                      controller: scrollController,
                      child: CustomScrollView(
                        physics: const ClampingScrollPhysics(),
                        controller: scrollController,
                        slivers: [
                          SliverList.builder(
                            itemCount: value.length,
                            itemBuilder: (context, index) => Material(
                              color: Colors.transparent,
                              child: SizedBox(
                                height: widget.itemHeight,
                                child: Padding(
                                  padding: const EdgeInsets.all(6).copyWith(
                                    top: 0,
                                    bottom: 6,
                                  ),
                                  child: FilledButton.tonal(
                                    onPressed: () => onItemTap(value[index]),
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: widget.itemBuilder(
                                      context,
                                      index,
                                      value,
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
