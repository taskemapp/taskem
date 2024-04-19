import 'package:taskem/src/generated/team/team.pb.dart';

class RolePermissionModel {
  RolePermissionModel({
    required this.canAddTask,
    required this.canAssignTask,
    required this.canApproveTask,
    required this.canInviteInTeam,
    required this.canCreateRoles,
  });

  factory RolePermissionModel.from(RolePermission permission) {
    return RolePermissionModel(
      canAddTask: permission.canAddTask,
      canAssignTask: permission.canAssignTask,
      canApproveTask: permission.canApproveTask,
      canInviteInTeam: permission.canInviteInTeam,
      canCreateRoles: permission.canCreateRoles,
    );
  }

  final bool canAddTask;
  final bool canAssignTask;
  final bool canApproveTask;
  final bool canInviteInTeam;
  final bool canCreateRoles;
}
