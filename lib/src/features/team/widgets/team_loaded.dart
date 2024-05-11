part of '../screens/team_screen.dart';

class _TeamLoaded extends StatefulWidget {
  const _TeamLoaded({
    required this.team,
  });

  final TeamModel team;

  @override
  State<_TeamLoaded> createState() => _TeamLoadedState();
}

class _TeamLoadedState extends State<_TeamLoaded>
    with SingleTickerProviderStateMixin, PlatformCheck {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.team.name,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final created = await context.push<bool>(
            ScreenRouteBuilder()
                .path(ScreenRoutes.team)
                .param(widget.team.id)
                .path(ScreenRoutes.createTask)
                .build(),
            extra: widget.team.members,
          );
          if (created != null && created && context.mounted) {
            context.read<TeamTaskBloc>().add(
                  TeamTaskEvent.getTasks(
                    teamId: widget.team.id,
                  ),
                );
          }
        },
        icon: Icon(
          isCupertino ? CupertinoIcons.create : Icons.create,
        ),
        label: const Text(
          'Создать задачу',
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<SpecificTeamBloc>().add(
                SpecificTeamEvent.getTeam(teamId: widget.team.id),
              );
          context.read<TeamTaskBloc>().add(
                TeamTaskEvent.getTasks(teamId: widget.team.id),
              );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimension.screenPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Описание',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    widget.team.description,
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocConsumer<TeamTaskBloc, TeamTaskState>(
                listener: (context, state) {
                  if (state is TeamTaskAssignPermissionDeniedError) {
                    SnackBarService.error(
                      context,
                      'Нет прав, для назначения на задачу',
                    );
                  }
                  if (state is TeamTaskAssignError) {
                    SnackBarService.error(
                      context,
                      'Ошибка при назначении на задачу',
                    );
                  }
                  if (state is TeamTaskCompleted) {
                    SnackBarService.info(
                      context,
                      'Задача завершена',
                    );
                  }
                  if (state is TeamTaskAssigned) {
                    SnackBarService.info(
                      context,
                      'Пользователь назначен на задачу',
                    );
                    tabController.animateTo(1);
                  }
                },
                buildWhen: (previous, current) =>
                    current is! TeamTaskAssignError ||
                    current is! TeamTaskAssignPermissionDeniedError ||
                    current is! TeamTaskCompleted ||
                    current is! TeamTaskAssigned,
                builder: (context, state) => switch (state) {
                  TeamTaskInitial() => Animate(
                      effects: const [
                        FadeEffect(),
                      ],
                      child: const LoadingWidget(),
                    ),
                  TeamTaskLoaded(tasks: final tasks) => Animate(
                      effects: const [
                        FadeEffect(),
                      ],
                      child: _BacklogWidget(
                        tasks: tasks,
                        team: widget.team,
                        tabController: tabController,
                      ),
                    ),
                  _ => Center(
                      child: TryAgainButton(
                        onPressed: () {
                          context.read<TeamTaskBloc>().add(
                                TeamTaskEvent.getTasks(
                                  teamId: widget.team.id,
                                ),
                              );
                        },
                      ),
                    ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TeamTaskCard extends StatelessWidget with PlatformCheck {
  const _TeamTaskCard({
    required this.team,
    required this.task,
    this.canAssign = true,
  });

  final TeamModel team;
  final TaskModel task;

  final bool canAssign;

  void _openAssignTaskBottomSheet(
    BuildContext context,
    String taskId,
    List<UserInfoModel> members,
  ) {
    showFlexibleBottomSheet<void>(
      context: context,
      initHeight: 0.5,
      maxHeight: 0.5,
      anchors: [0.5],
      isSafeArea: true,
      builder: (
        modalContext,
        scrollController,
        bottomSheetOffset,
      ) {
        return Provider.value(
          value: context.read<TeamTaskBloc>(),
          child: _AssignTaskForm(
            scrollController: scrollController,
            task: task,
            team: team,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Card(
      color: theme.colorScheme.primaryContainer,
      margin: EdgeInsets.zero,
      child: ListTile(
        enableFeedback: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Dimension.borderRadius,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.name,
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Назначено: ${task.assignedUsers.length}',
                style: theme.textTheme.labelMedium,
              ),
              Text(
                'Создано: ${DateFormat('d MMMM HH:mm').format(task.createdDate)}',
                style: theme.textTheme.labelMedium,
              ),
              Text(
                'Срок: ${DateFormat('d MMMM HH:mm').format(task.endDate)}',
                style: theme.textTheme.labelMedium,
              ),
              Text(
                'Статус: ${task.status}',
                style: theme.textTheme.labelMedium,
              ),
            ],
          ),
        ),
        trailing: canAssign
            ? IconButton(
                onPressed: () {
                  final membersCanAssigned =
                      List<UserInfoModel>.from(team.members)
                        ..removeWhere(
                          (user) {
                            for (final element in task.assignedUsers) {
                              return element.id == user.id;
                            }
                            return false;
                          },
                        );
                  _openAssignTaskBottomSheet(
                    context,
                    task.id,
                    membersCanAssigned,
                  );
                },
                icon: Icon(
                  isCupertino
                      ? CupertinoIcons.person_add
                      : Icons.person_add_alt,
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
