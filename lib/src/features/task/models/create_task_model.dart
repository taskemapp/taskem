class CreateTaskModel {
  CreateTaskModel({
    required this.name,
    required this.description,
    required this.endDateTime,
    required this.teamId,
  });

  final String name;

  final String description;

  final DateTime endDateTime;
  final String teamId;
}
