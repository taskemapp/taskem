part of '../screens/team_screen.dart';

class _BacklogWidget extends StatefulWidget {
  const _BacklogWidget({
    required this.tasks,
    required this.team,
    super.key,
    this.tabController,
  });

  final List<TaskModel> tasks;
  final TeamModel team;
  final TabController? tabController;

  @override
  State<_BacklogWidget> createState() => _BacklogWidgetState();
}

class _BacklogWidgetState extends State<_BacklogWidget>
    with SingleTickerProviderStateMixin, PlatformCheck {
  late final TabController controller;

  int index = 0;

  List<TaskModel> backlogTasks = [];
  List<TaskModel> sprintTasks = [];

  final List<Tab> tabs = [
    const Tab(text: 'Беклог'),
    const Tab(text: 'Спринт'),
    const Tab(text: 'Все'),
  ];

  @override
  void initState() {
    super.initState();
    backlogTasks = List<TaskModel>.from(widget.tasks)
        .where(
          (element) =>
              element.status.toString() == const TaskStatus.paused().toString(),
        )
        .toList();
    sprintTasks = List<TaskModel>.from(widget.tasks)
        .where(
          (element) =>
              element.status.toString() ==
              const TaskStatus.inProgress().toString(),
        )
        .toList();
    controller = widget.tabController ??
        TabController(
          length: 3,
          vsync: this,
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Column(
      children: [
        if (widget.tasks.isNotEmpty)
          Expanded(
            child: Column(
              children: [
                TabBar(
                  controller: controller,
                  splashBorderRadius: BorderRadius.circular(
                    Dimension.borderRadius,
                  ),
                  indicatorSize: TabBarIndicatorSize.label,
                  labelStyle: theme.textTheme.bodyMedium,
                  unselectedLabelStyle: theme.textTheme.labelLarge,
                  splashFactory: isCupertino
                      ? NoSplash.splashFactory
                      : InkSparkle.splashFactory,
                  onTap: (value) => index = value,
                  tabs: tabs,
                ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller,
                    children: [
                      if (backlogTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: backlogTasks.length,
                          padding: const EdgeInsets.only(bottom: 80),
                          itemBuilder: (context, index) {
                            final task = backlogTasks[index];
                            return Padding(
                              padding: const EdgeInsets.all(8).copyWith(
                                bottom: 0,
                              ),
                              child: _TeamTaskCard(
                                team: widget.team,
                                task: task,
                              ),
                            );
                          },
                        ).animate().fade()
                      else
                        const Center(
                          child: InfoText(title: 'Бэклог пуст'),
                        ).animate().fade(),
                      if (sprintTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: sprintTasks.length,
                          padding: const EdgeInsets.only(bottom: 80),
                          itemBuilder: (context, index) {
                            final task = sprintTasks[index];
                            return Slidable(
                              endActionPane: ActionPane(
                                extentRatio: 0.15,
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      context.read<TeamTaskBloc>().add(
                                            TeamTaskEvent.complete(
                                              taskId: task.id,
                                            ),
                                          );
                                    },
                                    backgroundColor:
                                        theme.colorScheme.tertiaryContainer,
                                    foregroundColor:
                                        theme.colorScheme.onTertiaryContainer,
                                    icon: isCupertino
                                        ? CupertinoIcons.check_mark_circled
                                        : Icons.check_circle_rounded,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8).copyWith(
                                  bottom: 0,
                                ),
                                child: _TeamTaskCard(
                                  team: widget.team,
                                  task: task,
                                ),
                              ),
                            );
                          },
                        ).animate().fade()
                      else
                        const Center(
                          child: InfoText(title: 'Нет задач на спринт'),
                        ).animate().fade(),
                      ListView.builder(
                        itemCount: widget.tasks.length,
                        padding: const EdgeInsets.only(bottom: 80),
                        itemBuilder: (context, index) {
                          final task = widget.tasks[index];
                          return Padding(
                            padding: const EdgeInsets.all(8).copyWith(
                              bottom: 0,
                            ),
                            child: _TeamTaskCard(
                              canAssign: false,
                              team: widget.team,
                              task: task,
                            ),
                          );
                        },
                      ).animate().fade(),
                    ],
                  ),
                ),
              ],
            ),
          )
        else
          const Center(
            child: InfoText(
              title: 'Нет задач',
            ),
          ),
      ],
    );
  }
}
