part of '../screens/team_screen.dart';

class _AssignTaskForm extends StatefulWidget {
  const _AssignTaskForm({
    required this.bloc,
    required this.scrollController,
    required this.task,
    required this.team,
  });

  final TeamTaskBloc bloc;
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
    return AnimatedPadding(
      padding: const EdgeInsets.all(16).copyWith(
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
                child: UserExpandedDownButton(
                  items: widget.team.members,
                  chosenEntity: assignedUser.value,
                  onChanged: (value) => setState(() {
                    assignedUser.value = value;
                  }),
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
                    return ElevatedButton.icon(
                      onPressed: value != null
                          ? () {
                              if (assignedUser.value != null) {
                                widget.bloc.add(
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
                        'Создать',
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
