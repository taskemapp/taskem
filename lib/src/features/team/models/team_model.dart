import 'package:taskem/src/features/shared/model/user_info_model.dart';
import 'package:taskem/src/generated/team/team.pb.dart';

class TeamModel {
  TeamModel({
    required this.id,
    required this.name,
    required this.description,
    required this.members,
    required this.creator,
  });

  factory TeamModel.from(TeamResponse response) {
    return TeamModel(
      id: response.id,
      name: response.name,
      description: response.description,
      members: response.members.map(UserInfoModel.from).toList(),
      creator: response.creator,
    );
  }

  final String id;
  final String name;
  final String description;
  final List<UserInfoModel> members;

  final String creator;
}
