import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onShuffle;
  final VoidCallback onDeselectAll;
  final VoidCallback onSubmit;

  const ActionButtons({
    Key? key,
    required this.onShuffle,
    required this.onDeselectAll,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(onPressed: onShuffle, child: Text("Shuffle")),
          ElevatedButton(onPressed: onDeselectAll, child: Text("Deselect All")),
          ElevatedButton(onPressed: onSubmit, child: Text("Submit")),
        ],
      ),
    );
  }
}
