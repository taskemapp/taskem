part of '../screens/team_screen.dart';

class _AssignTaskForm extends StatefulWidget {
  const _AssignTaskForm({
    required this.scrollController,
    required this.task,
    required this.team,
  });

  final TaskModel task;
  final TeamModel team;
  final ScrollController scrollController;

  @override
  State<_AssignTaskForm> createState() => _AssignTaskFormState();
}

class _AssignTaskFormState extends State<_AssignTaskForm> with PlatformCheck {
  late final TextEditingController teamNameController;
  late final TextEditingController teamDescriptionController;
  final _formKey = GlobalKey<FormState>();
  late final ValueNotifier<UserInfoModel?> assignedUser;

  @override
  void initState() {
    super.initState();
    widget.team.members.removeWhere((member) {
      return widget.task.assignedUsers.contains(member);
    });
    assignedUser = ValueNotifier(null);
    teamNameController = TextEditingController();
    teamDescriptionController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    assignedUser.dispose();
    teamNameController.dispose();
    teamDescriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return AnimatedPadding(
      padding: EdgeInsets.all(Dimension.screenPadding).copyWith(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      duration: const Duration(
        milliseconds: 200,
      ),
      child: Material(
        child: Form(
          key: _formKey,
          child: ListView(
            controller: widget.scrollController,
            physics: const ClampingScrollPhysics(),
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Назначенный пользователь',
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(Dimension.borderRadius),
                child: ExpandedDownField<UserInfoModel>(
                  items: widget.team.members,
                  onChanged: (value) {
                    assignedUser.value = value;
                    return value.userName;
                  },
                  suggestionFilter: (String search) {
                    return widget.team.members
                        .where(
                          (element) =>
                              element.userName
                                  .toLowerCase()
                                  .contains(search.toLowerCase()) ||
                              search
                                  .toLowerCase()
                                  .contains(element.userName.toLowerCase()),
                        )
                        .toList();
                  },
                  itemBuilder: (
                    BuildContext context,
                    int index,
                    List<UserInfoModel> items,
                  ) {
                    return Row(
                      children: [
                        const SizedBox(
                          width: 12,
                        ),
                        ProfileAvatar(
                          url:
                              'http://kissota.ru:9600/file/users/${items[index].userName}/avatar.jpg',
                          token: context.read<LoggedInState>().state!.token,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: context.screenWidth / 8,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  items[index].userName,
                                  overflow: TextOverflow.fade,
                                  style: theme.textTheme.bodyMedium,
                                ),
                                Text(
                                  items[index].role,
                                  style: theme.textTheme.labelSmall,
                                  overflow: TextOverflow.fade,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ValueListenableBuilder(
                  valueListenable: assignedUser,
                  builder: (context, value, child) {
                    return FilledButton.tonalIcon(
                      onPressed: value != null
                          ? () {
                              if (assignedUser.value != null) {
                                context.read<TeamTaskBloc>().add(
                                      TeamTaskEvent.assign(
                                        taskId: widget.task.id,
                                        teamId: widget.team.id,
                                        userId: assignedUser.value!.id,
                                      ),
                                    );
                              }
                            }
                          : null,
                      icon: Icon(
                        isCupertino ? CupertinoIcons.add : Icons.add,
                      ),
                      label: const Text(
                        'Назначить',
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
