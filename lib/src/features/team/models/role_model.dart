import 'package:taskem/src/features/team/models/role_permission_model.dart';
import 'package:taskem/src/generated/team/team.pb.dart';

class RoleModel {
  RoleModel({
    required this.name,
    required this.priority,
    required this.permission,
  });

  factory RoleModel.from(Role response) {
    final permission = RolePermissionModel.from(response.permission);

    return RoleModel(
      name: response.roleName,
      priority: response.priority,
      permission: permission,
    );
  }

  final String name;
  final int priority;
  final RolePermissionModel permission;
}
