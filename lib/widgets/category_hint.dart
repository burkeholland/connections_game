import 'package:flutter/material.dart';

class CategoryHint extends StatelessWidget {
  final String title;
  final List<String> words;
  final String color;

  const CategoryHint({
    Key? key,
    required this.title,
    required this.words,
    required this.color,
  }) : super(key: key);

  Color _getColor() {
    switch (color) {
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
      color: _getColor(),
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        "$title\n${words.join(', ')}",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
