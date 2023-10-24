class GameModel {
  final String id;
  final String title;
  final String coverUrl;
  final String? statusId;
  final bool isCompleted;
  final bool isMultiplayer;

  const GameModel({
    required this.id,
    required this.title,
    required this.coverUrl,
    required this.statusId,
    this.isCompleted = false,
    this.isMultiplayer = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'coverUrl': coverUrl,
      'statusId': statusId,
      'isCompleted': isCompleted,
      'isMultiplayer': isMultiplayer
    };
  }
}
