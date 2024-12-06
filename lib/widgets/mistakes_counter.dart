import 'package:flutter/material.dart';

class MistakesCounter extends StatelessWidget {
  final int mistakesRemaining;

  const MistakesCounter({
    Key? key,
    required this.mistakesRemaining,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Mistakes Remaining:"),
          SizedBox(width: 8),
          Row(
            children: List.generate(
              4,
              (index) => Icon(
                Icons.circle,
                size: 12,
                color:
                    index < mistakesRemaining ? Colors.black : Colors.black26,
              ),
            ).toList(),
          ),
        ],
      ),
    );
  }
}
