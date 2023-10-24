import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zerei_opensource/core/data/game_status_data.dart';
import 'package:zerei_opensource/core/models/game_model.dart';
import 'package:zerei_opensource/core/store/search.store.dart';
import 'package:zerei_opensource/widgets/change_game_status_widget.dart';

class SearchedGameItem extends StatelessWidget {
  final GameModel game;
  const SearchedGameItem({
    super.key,
    required this.game,
  });

  final String voidString = '';

  Color _getGameStatus() {
    for (var i = 0; i < gameStatusData.length; i++) {
      if (game.statusId == gameStatusData[i].id) {
        return gameStatusData[i].color;
      }
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    final searchStore = Provider.of<SearchStore>(context);

    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (context) => ChangeGameStatusWidget(
          key: ValueKey(game.id),
          game: game,
          refreshGameList: searchStore.refreshGameList,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[800],
          borderRadius: BorderRadius.circular(10),
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        height: 180,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: game.coverUrl == 'voidUrl'
                        ? Container(
                            width: 120,
                            color: Colors.blueGrey,
                            child: Center(
                              child: Icon(
                                Icons.question_mark,
                                color: Theme.of(context).colorScheme.secondary,
                                size: 50,
                              ),
                            ),
                          )
                        : Image.network(
                            game.coverUrl,
                            fit: BoxFit.fill,
                            width: 120,
                          ),
                  ),
                  ClipPath(
                    clipper: CustomClipPath(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _getGameStatus(),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(8),
                        ),
                      ),
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      game.title,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        voidString,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white54,
                        ),
                        softWrap: true,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
