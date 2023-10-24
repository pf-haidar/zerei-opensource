import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:zerei_opensource/core/store/my_games_status.store.dart';
import 'package:zerei_opensource/widgets/game_item.dart';
import 'package:zerei_opensource/core/models/game_status_model.dart';

class MyStatusGameView extends StatelessWidget {
  final GameStatusModel status;
  const MyStatusGameView({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MyGamesStatusStore>(context);
    store.getUserGames(status.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(status.title),
      ),
      body: Observer(
        builder: (context) => store.myGamesByStatus.isNotEmpty
            ? Container(
                margin: const EdgeInsets.only(
                  top: 8,
                  left: 4,
                  right: 4,
                  bottom: 8,
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 180,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemCount: store.myGamesByStatus.length,
                  itemBuilder: ((context, index) {
                    return GameItem(
                      game: store.myGamesByStatus[index],
                      statusId: status.id,
                    );
                  }),
                ),
              )
            : const Center(
                child: Text(
                  'Vazio',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
      ),
    );
  }
}
