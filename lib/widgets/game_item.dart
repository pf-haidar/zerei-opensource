import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zerei_opensource/core/models/game_model.dart';
import 'package:zerei_opensource/core/store/my_games_status.store.dart';
import 'package:zerei_opensource/widgets/change_game_status_widget.dart';

class GameItem extends StatelessWidget {
  final GameModel game;
  final String statusId;
  const GameItem({
    super.key,
    required this.game,
    required this.statusId,
  });

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MyGamesStatusStore>(context);

    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (context) => ChangeGameStatusWidget(
          key: ValueKey(game.id),
          game: game,
          refreshGameList: () => store.getUserGames(statusId),
        ),
      ),
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          game.coverUrl,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
