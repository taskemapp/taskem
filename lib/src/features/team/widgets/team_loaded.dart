part of '../screens/team_screen.dart';

class _TeamLoaded extends StatelessWidget with PlatformCheck {
  const _TeamLoaded({
    required this.team,
    super.key,
  });

  final TeamModel team;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          team.name,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.go(
            '${ScreenRoutes.team.path}/${team.id}/create',
            extra: team.members,
          );
        },
        icon: Icon(
          isCupertino ? CupertinoIcons.create : Icons.create,
        ),
        label: const Text(
          'Создать задание',
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<SpecificTeamBloc>().add(
                SpecificTeamEvent.getTeam(teamId: team.id),
              );
          context.read<TeamTaskBloc>().add(
                TeamTaskEvent.getTasks(teamId: team.id),
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
                    team.description,
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<TeamTaskBloc, TeamTaskState>(
                builder: (context, state) => switch (state) {
                  TeamTaskInitial() => const LoadingWidget(),
                  TeamTaskLoaded(tasks: final tasks) => _BacklogWidget(
                      tasks: tasks,
                      team: team,
                    ),
                  _ => Center(
                      child: TryAgainButton(
                        onPressed: () {
                          context.read<TeamTaskBloc>().add(
                                TeamTaskEvent.getTasks(
                                  teamId: team.id,
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
    super.key,
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
    showFlexibleBottomSheet<TeamTaskEvent>(
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
        return _AssignTaskForm(
          bloc: context.read<TeamTaskBloc>(),
          scrollController: scrollController,
          task: task,
          team: team,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Card(
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
