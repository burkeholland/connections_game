class Game {
  final int gameId;
  final List<GameGroup> groups;

  Game({required this.gameId, required this.groups});

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      gameId: json['gameId'],
      groups: (json['groups'] as List)
          .map((group) => GameGroup.fromJson(group))
          .toList(),
    );
  }
}

class GameGroup {
  final String title;
  final List<String> words;
  final String color;

  GameGroup({required this.title, required this.words, required this.color});

  factory GameGroup.fromJson(Map<String, dynamic> json) {
    return GameGroup(
      title: json['title'],
      words: List<String>.from(json['words']),
      color: json['color'],
    );
  }
}
