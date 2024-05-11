import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskem/src/core/extensions/context_extension.dart';
import 'package:taskem/src/core/helpers/animation_config.dart';
import 'package:taskem/src/core/helpers/dimension.dart';
import 'package:taskem/src/core/helpers/platform_check_mixin.dart';
import 'package:taskem/src/core/widgets/info_text.dart';
import 'package:taskem/src/features/task/controller/task_bloc.dart';
import 'package:taskem/src/features/task/models/task_model.dart';
import 'package:taskem/src/features/task/widgets/task_app_bar.dart';
import 'package:taskem/src/features/task/widgets/task_card.dart';
import 'package:taskem/src/features/task/widgets/task_date_carousel.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({
    required this.tasks,
    super.key,
  });

  final List<TaskModel> tasks;

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> with PlatformCheck {
  @override
  void initState() {
    super.initState();
    tasksOnDate = widget.tasks
        .where(
          (element) => element.endDate.day == currentDate.day,
        )
        .toList();
  }

  DateTime currentDate = DateTime.now();
  List<TaskModel> tasksOnDate = [];

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    const blurSigma = 5.0;
    const toolbarHeight = 105.0;
    const heroTag = 'profile_avatar';

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleSpacing: Dimension.screenPadding,
        title: const TaskAppBarTitle(),
      ),
      drawerEnableOpenDragGesture: false,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<TaskBloc>().add(
                  const TaskEvent.getTasks(),
                );
          },
          child: Animate(
            effects: const [
              FadeEffect(
                duration: AnimationConfig.longDuration,
                curve: AnimationConfig.curve,
              ),
            ],
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  snap: true,
                  automaticallyImplyLeading: false,
                  scrolledUnderElevation: 0,
                  toolbarHeight: toolbarHeight,
                  titleSpacing: Dimension.screenPadding,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        Positioned(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: blurSigma,
                              sigmaY: blurSigma,
                            ),
                            child: const SizedBox.shrink(),
                          ),
                        ),
                        ColoredBox(
                          color:
                              theme.colorScheme.surfaceBright.withOpacity(.5),
                          child: const SizedBox.expand(),
                        ),
                        TaskDateCarousel(
                          duration: AnimationConfig.shortDuration,
                          onDateChange: (DateTime date) {
                            setState(
                              () {
                                currentDate = date;
                                tasksOnDate = widget.tasks
                                    .where(
                                      (element) =>
                                          element.endDate.day ==
                                          currentDate.day,
                                    )
                                    .toList();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                if (tasksOnDate.isNotEmpty)
                  SliverList.builder(
                    itemCount: tasksOnDate.length,
                    itemBuilder: (context, index) {
                      final task = tasksOnDate[index];
                      return TaskCard(task: task);
                    },
                  )
                else
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: InfoText(
                        title: 'Нет задач',
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
