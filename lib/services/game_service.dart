import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/game.dart';

class GameService {
  Future<Game> loadGame() async {
    final String jsonString = await rootBundle.loadString('lib/games.json');
    final json = jsonDecode(jsonString);
    return Game.fromJson(json['games'][0]);
  }
}
