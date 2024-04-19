import 'package:taskem/src/generated/team/team.pb.dart';

class UserInfoModel {
  UserInfoModel({
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
}
