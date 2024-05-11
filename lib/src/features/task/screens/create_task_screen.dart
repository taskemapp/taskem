import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:taskem/src/core/extensions/context_extension.dart';
import 'package:taskem/src/core/extensions/theme_extension.dart';
import 'package:taskem/src/core/helpers/dimension.dart';
import 'package:taskem/src/core/helpers/platform_check_mixin.dart';
import 'package:taskem/src/core/helpers/snack_bar_service.dart';
import 'package:taskem/src/core/widgets/custom_text_field.dart';
import 'package:taskem/src/features/shared/model/user_info_model.dart';
import 'package:taskem/src/features/task/controller/task_bloc.dart';
import 'package:taskem/src/features/task/models/create_task_model.dart';
import 'package:taskem/src/i18n/translations.g.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({
    required this.teamId,
    required this.members,
    super.key,
  });

  final String teamId;
  final List<UserInfoModel> members;

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen>
    with PlatformCheck {
  late final TextEditingController taskNameController;
  late final TextEditingController taskDescriptionController;
  late final ScrollController scrollController;
  final _formKey = GlobalKey<FormState>();
  DateTime? endDate;

  UserInfoModel? assignedUser;

  @override
  void initState() {
    super.initState();
    taskNameController = TextEditingController();
    taskDescriptionController = TextEditingController();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    taskNameController.dispose();
    taskDescriptionController.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final fillColor = theme.isDark ? const Color(0xFF313131) : Colors.white;

    final padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ).copyWith(right: 8);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Новое задание'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimension.screenPadding,
          ),
          child: BlocListener<TaskBloc, TaskState>(
            listener: (BuildContext context, TaskState state) {
              if (state is TaskCreated) {
                SnackBarService.info(context, 'Задача создана');
                context.pop(true);
              }
              if (state is TaskPermissionDenied) {
                SnackBarService.error(context, 'Недостаточно прав');
              }
              if (state is TaskError) {
                SnackBarService.error(context, 'Ошибка создания задачи');
              }
            },
            child: Form(
              key: _formKey,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ListView(
                  physics: const PageScrollPhysics(),
                  shrinkWrap: true,
                  controller: scrollController,
                  children: [
                    CustomTextField(
                      title: 'Название',
                      controller: taskNameController,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextField(
                      title: 'Описание',
                      canBeEmpty: true,
                      controller: taskDescriptionController,
                      maxLines: 5,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Дата окончания',
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        Dimension.borderRadius,
                      ),
                      child: ColoredBox(
                        color: fillColor,
                        child: Padding(
                          padding: padding,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  endDate != null
                                      ? DateFormat('d MMMM y, HH:mm')
                                          .format(endDate!)
                                      : '',
                                  style: theme.textTheme.bodyLarge,
                                ),
                              ),
                              FilledButton.tonal(
                                onPressed: () async {
                                  endDate = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                    locale: LocaleSettings
                                        .currentLocale.flutterLocale,
                                    lastDate: DateTime.now().add(
                                      const Duration(days: 365),
                                    ),
                                  );
                                  if (endDate == null) {
                                    return;
                                  }
                                  if (!context.mounted) {
                                    return;
                                  }
                                  final time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );
                                  if (time == null || endDate == null) {
                                    return;
                                  }
                                  setState(() {
                                    endDate = endDate!.copyWith(
                                      hour: time.hour,
                                      minute: time.minute,
                                    );
                                  });
                                },
                                child: Icon(
                                  isCupertino
                                      ? CupertinoIcons.calendar
                                      : Icons.calendar_month,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FilledButton.icon(
                        onPressed: () {
                          if (_formKey.currentState!.validate() &&
                              endDate != null) {
                            final taskModel = CreateTaskModel(
                              name: taskNameController.text,
                              description: taskDescriptionController.text,
                              endDateTime: endDate!,
                              teamId: widget.teamId,
                            );
                            context.read<TaskBloc>().add(
                                  TaskEvent.create(
                                    taskModel: taskModel,
                                  ),
                                );
                          }
                        },
                        icon: Icon(
                          isCupertino ? CupertinoIcons.add : Icons.add,
                        ),
                        label: const Text(
                          'Создать',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ).animate().fade(),
      ),
    );
  }
}
