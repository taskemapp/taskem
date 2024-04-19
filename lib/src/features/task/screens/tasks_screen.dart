import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:taskem/src/core/extensions/context_extension.dart';
import 'package:taskem/src/core/helpers/dimension.dart';
import 'package:taskem/src/core/widgets/info_text.dart';
import 'package:taskem/src/features/task/controller/task_bloc.dart';
import 'package:taskem/src/features/task/models/task_model.dart';
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

class _TasksScreenState extends State<TasksScreen> {
  late final Stream<DateTime> titleDateStream;
  final Duration animationDuration = const Duration(milliseconds: 200);

  @override
  void initState() {
    super.initState();
    titleDateStream = Stream.periodic(const Duration(minutes: 1), (count) {
      return DateTime.now();
    });
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
    final translation = context.translation;
    const blurSigma = 5.0;
    const toolbarHeight = 105.0;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: StreamBuilder<DateTime>(
          stream: titleDateStream,
          builder: (context, snapshot) {
            return Text(
              DateFormat('d MMMM, y').format(
                snapshot.data ?? DateTime.now(),
              ),
            );
          },
        ),
      ),
      drawerEnableOpenDragGesture: false,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<TaskBloc>().add(const TaskEvent.getTasks());
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                snap: true,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
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
                        color: theme.colorScheme.surfaceBright.withOpacity(.5),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimension.screenPadding / 2,
                            horizontal: Dimension.screenPadding,
                          ),
                          child: SizedBox(
                            height: toolbarHeight,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  width: 25,
                                  height: MediaQuery.of(context).size.height,
                                  child: ClipRRect(
                                    child: ImageFiltered(
                                      imageFilter: ImageFilter.blur(
                                          sigmaX: 10, sigmaY: 10),
                                      child: ShaderMask(
                                        shaderCallback: (rect) {
                                          return LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.black,
                                              Colors.black.withOpacity(0),
                                            ],
                                            stops: const [0.4, 0.75],
                                          ).createShader(rect);
                                        },
                                        blendMode: BlendMode.dstOut,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      TaskDateCarousel(
                        duration: animationDuration,
                        onDateChange: (DateTime date) {
                          setState(
                            () {
                              currentDate = date;
                              tasksOnDate = widget.tasks
                                  .where(
                                    (element) =>
                                        element.endDate.day == currentDate.day,
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
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: const Center(
                    child: InfoText(
                      title: 'Нет задач',
                    ),
                  ).animate().fade(duration: animationDuration),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
