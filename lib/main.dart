import 'package:flutter/material.dart';
import 'widgets/app_header.dart';
import 'widgets/game_instructions.dart';
import 'widgets/category_hint.dart';
import 'widgets/game_grid.dart';
import 'widgets/mistakes_counter.dart';
import 'widgets/action_buttons.dart';
import 'models/game.dart';
import 'services/game_service.dart';
import 'widgets/solved_group.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Set<String> selectedItems = {};
  Set<String> incorrectItems = {};
  Game? currentGame;
  List<String> shuffledWords = [];
  List<GameGroup> solvedGroups = [];
  int mistakesRemaining = 4;
  final GameService _gameService = GameService();
  bool isShaking = false;

  @override
  void initState() {
    super.initState();
    _loadGame();
  }

  Future<void> _loadGame() async {
    final game = await _gameService.loadGame();
    final words = game.groups.expand((group) => group.words).toList()
      ..shuffle();
    setState(() {
      currentGame = game;
      shuffledWords = words;
    });
  }

  void toggleSelection(String item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else if (selectedItems.length < 4) {
        selectedItems.add(item);
      }
    });
  }

  void deselectAll() {
    setState(() {
      selectedItems.clear();
    });
  }

  void shuffleWords() {
    setState(() {
      shuffledWords.shuffle();
    });
  }

  void _handleIncorrectSubmission() {
    setState(() {
      mistakesRemaining--;
      incorrectItems = Set.from(selectedItems);
      isShaking = true;
    });

    // Clear the incorrect animation after a delay
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          incorrectItems.clear();
          isShaking = false;
        });
      }
    });
  }

  bool _checkSubmission() {
    if (selectedItems.length != 4 || currentGame == null) return false;

    for (var group in currentGame!.groups) {
      if (group.words.toSet().containsAll(selectedItems)) {
        setState(() {
          solvedGroups.add(group);
          shuffledWords.removeWhere((word) => selectedItems.contains(word));
          selectedItems.clear();
          incorrectItems.clear();
        });
        return true;
      }
    }

    _handleIncorrectSubmission();
    return false;
  }

  @override
  Widget build(BuildContext context) {
    if (currentGame == null) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppHeader(),
      body: Column(
        children: [
          GameInstructions(),
          ...solvedGroups.map((group) => SolvedGroup(group: group)),
          GameGrid(
            words: shuffledWords,
            selectedItems: selectedItems,
            incorrectItems: incorrectItems,
            isShaking: isShaking,
            onToggleSelection: toggleSelection,
          ),
          MistakesCounter(mistakesRemaining: mistakesRemaining),
          ActionButtons(
            onDeselectAll: deselectAll,
            onShuffle: shuffleWords,
            onSubmit: () {
              if (selectedItems.length == 4) {
                _checkSubmission();
              }
            },
          ),
        ],
      ),
    );
  }
}
