import 'package:taskem/src/generated/team/team.pb.dart';

class CreatedTeamModel {
  CreatedTeamModel({
    required this.message,
  });

  factory CreatedTeamModel.from(CreateTeamResponse response) {
    return CreatedTeamModel(message: response.message);
  }

  final String message;
}
