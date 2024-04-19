import 'package:taskem/src/features/shared/model/user_info_model.dart';
import 'package:taskem/src/features/task/models/task_status.dart';
import 'package:taskem/src/generated/task/task.pb.dart';

class TaskModel {
  TaskModel({
    required this.id,
    required this.name,
    required this.description,
    required this.createdDate,
    required this.endDate,
    required this.assignedUsers,
    required this.status,
  });

  factory TaskModel.from(TaskResponse response) {
    return TaskModel(
      id: response.id,
      name: response.name,
      description: response.description,
      createdDate: DateTime.fromMillisecondsSinceEpoch(
        response.createdTimestamp.seconds.toInt() * 1000,
      ),
      endDate: DateTime.fromMillisecondsSinceEpoch(
        response.endTimestamp.seconds.toInt() * 1000,
      ),
      assignedUsers: response.assignedUsers
          .map<UserInfoModel>(UserInfoModel.from)
          .toList(),
      status: switch (response.status) {
        'finished' => const TaskStatus.finished(),
        'in progress' => const TaskStatus.inProgress(),
        'canceled' => const TaskStatus.canceled(),
        'paused' => const TaskStatus.paused(),
        _ => throw UnimplementedError(),
      },
    );
  }

  final String id;
  final String name;
  final String description;
  final DateTime createdDate;
  final DateTime endDate;
  final List<UserInfoModel> assignedUsers;
  final TaskStatus status;
}
