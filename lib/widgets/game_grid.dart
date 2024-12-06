import 'package:flutter/material.dart';
import 'game_card.dart';

class GameGrid extends StatelessWidget {
  final List<String> words;
  final Set<String> selectedItems;
  final Set<String> incorrectItems;
  final bool isShaking;
  final Function(String) onToggleSelection;

  const GameGrid({
    Key? key,
    required this.words,
    required this.selectedItems,
    required this.incorrectItems,
    required this.onToggleSelection,
    required this.isShaking,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 4,
        padding: EdgeInsets.all(16.0),
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        children: words.map((text) {
          return GameCard(
            text: text,
            isSelected: selectedItems.contains(text),
            isIncorrect: incorrectItems.contains(text),
            isShaking: isShaking,
            onTap: () => onToggleSelection(text),
          );
        }).toList(),
      ),
    );
  }
}
