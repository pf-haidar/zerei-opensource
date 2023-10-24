import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:zerei_opensource/core/data/game_status_data.dart';
import 'package:zerei_opensource/core/models/game_model.dart';
import 'package:zerei_opensource/core/store/game_item.store.dart';
import 'package:zerei_opensource/widgets/dot_grow_widget.dart';

class ChangeGameStatusWidget extends StatelessWidget {
  final GameModel game;
  final Future<dynamic> Function() refreshGameList;

  const ChangeGameStatusWidget({
    super.key,
    required this.game,
    required this.refreshGameList,
  });

  @override
  Widget build(BuildContext context) {
    final gameItemStore = Provider.of<GameItemStore>(context);
    gameItemStore.setCurrentGame(game);

    return Observer(
      builder: (_) => gameItemStore.selectedGame.id != ''
          ? AlertDialog(
              backgroundColor: Theme.of(context).canvasColor,
              title: const Text('Status do jogo'),
              content: SizedBox(
                width: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: gameStatusData.length,
                  itemBuilder: (builder, index) {
                    return Theme(
                      data: ThemeData(
                          unselectedWidgetColor: gameStatusData[index].color),
                      child: RadioListTile(
                        activeColor: gameStatusData[index].color,
                        value: index,
                        groupValue: gameItemStore.selectedGame.statusId != null
                            ? int.parse(gameItemStore.selectedGame.statusId!)
                            : null,
                        title: Text(
                          gameStatusData[index].title,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onChanged: (value) {
                          gameItemStore.setCurrentGame(game, index).then(
                            (value) {
                              if (value) {
                                refreshGameList();
                              }
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Fechar'),
                ),
              ],
            )
          : DotGrowWidget(
              color: Theme.of(context).colorScheme.secondary,
            ),
    );
  }
}
