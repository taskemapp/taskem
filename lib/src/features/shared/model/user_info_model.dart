import 'package:meta/meta.dart';
import 'package:taskem/src/generated/team/team.pb.dart';

@immutable
class UserInfoModel {
  const UserInfoModel({
    required this.id,
    required this.userName,
    required this.role,
  });

  factory UserInfoModel.from(UserInfo response) {
    return UserInfoModel(
      id: response.id,
      userName: response.userName,
      role: response.role,
    );
  }

  final String id;
  final String userName;
  final String role;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInfoModel &&
          runtimeType == other.runtimeType &&
          userName == other.userName;

  @override
  int get hashCode => userName.hashCode;
}
