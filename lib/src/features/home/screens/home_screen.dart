import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskem/src/core/widgets/custom_progress_indicator.dart';
import 'package:taskem/src/core/widgets/try_again_button.dart';
import 'package:taskem/src/features/task/controller/task_bloc.dart';
import 'package:taskem/src/features/task/screens/tasks_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TaskBloc>().add(const TaskEvent.getTasks());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (BuildContext context, TaskState state) {
        if (state is TaskCreated) {
          context.read<TaskBloc>().add(const TaskEvent.getTasks());
        }
      },
      builder: (BuildContext context, state) => switch (state) {
        TaskError() => Scaffold(
            body: Center(
              child: TryAgainButton(
                onPressed: () {
                  context.read<TaskBloc>().add(const TaskEvent.getTasks());
                },
              ),
            ),
          ),
        TaskLoaded(tasks: final tasks) => TasksScreen(
            tasks: tasks,
          ),
        _ => const Scaffold(
            body: Center(
              child: CustomProgressIndicator(),
            ),
          ),
      },
    );
  }
}
