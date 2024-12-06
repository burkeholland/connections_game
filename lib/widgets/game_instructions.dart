import 'package:flutter/material.dart';

class GameInstructions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: Text(
          "Create four groups of four!",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
