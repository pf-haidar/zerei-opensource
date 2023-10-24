import 'package:flutter/material.dart';
import 'package:zerei_opensource/core/data/game_status_data.dart';
import 'package:zerei_opensource/widgets/game_status_item.dart';

class MyGamesView extends StatelessWidget {
  const MyGamesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: gameStatusData.map((status) {
          return GameStatusItem(status: status);
        }).toList(),
      ),
    );
  }
}
