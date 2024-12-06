import 'package:flutter/material.dart';
import '../models/game.dart';

class SolvedGroup extends StatelessWidget {
  final GameGroup group;

  const SolvedGroup({
    Key? key,
    required this.group,
  }) : super(key: key);

  Color _getColor() {
    switch (group.color) {
      case 'purple':
        return Colors.purple[100]!;
      case 'yellow':
        return Colors.yellow[100]!;
      case 'green':
        return Colors.green[100]!;
      case 'blue':
        return Colors.blue[100]!;
      default:
        return Colors.grey[100]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: _getColor(),
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        children: [
          Text(
            group.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            group.words.join(', '),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
