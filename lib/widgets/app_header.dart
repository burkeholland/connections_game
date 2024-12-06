import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Games"),
      actions: [
        Icon(Icons.lightbulb_outline),
        Icon(Icons.bar_chart),
        Icon(Icons.help_outline),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
