import 'package:mobx/mobx.dart';
import 'package:zerei_opensource/core/models/game_model.dart';
import 'package:zerei_opensource/core/services/auth/auth_service.dart';
import 'package:zerei_opensource/core/services/game/game_service.dart';

part 'my_games_status.store.g.dart';

// ignore: library_private_types_in_public_api
class MyGamesStatusStore = _MyGamesStatusStore with _$MyGamesStatusStore;

abstract class _MyGamesStatusStore with Store {
  @observable
  ObservableList<GameModel> myGamesByStatus = ObservableList<GameModel>();

  @observable
  GameModel selectedGame = const GameModel(
    id: '',
    title: '',
    coverUrl: '',
    statusId: '',
  );

  Future<void> getUserGames(String statusId) async {
    myGamesByStatus.clear();

    final user = AuthService().currentUser;
    List<GameModel> tempList = [];

    if (user != null) {
      tempList = await GameService().getUserGamesByStatus(user, statusId);
    }

    myGamesByStatus.addAll(tempList);
  }

  @action
  setCurrentGame(GameModel game, [int? newGameStatus]) {
    GameModel oldGame = GameModel(
      id: game.id,
      title: game.title,
      coverUrl: game.coverUrl,
      statusId:
          newGameStatus == null ? game.statusId : newGameStatus.toString(),
      isCompleted: game.isCompleted,
    );
    selectedGame = oldGame;
    if (newGameStatus != null) {
      changeGameStatus();
    }
  }

  @action
  Future<void> changeGameStatus() async {
    final user = AuthService().currentUser;

    if (user != null) {
      selectedGame = await GameService().getGameStatus(selectedGame, user);
    }
  }
}
