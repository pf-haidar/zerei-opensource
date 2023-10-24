import 'package:flutter/material.dart';
import 'package:zerei_opensource/core/models/game_status_model.dart';
import 'package:zerei_opensource/views/my_games_status_view.dart';

class GameStatusItem extends StatelessWidget {
  final GameStatusModel status;

  const GameStatusItem({
    super.key,
    required this.status,
  });

  void _selectStatus(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MyStatusGameView(status: status),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => _selectStatus(context),
        splashColor: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                status.color.withOpacity(0.5),
                status.color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Text(
            status.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
