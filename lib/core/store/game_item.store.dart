import 'package:mobx/mobx.dart';
import 'package:zerei_opensource/core/models/game_model.dart';
import 'package:zerei_opensource/core/services/auth/auth_service.dart';
import 'package:zerei_opensource/core/services/game/game_service.dart';


part 'game_item.store.g.dart';

// ignore: library_private_types_in_public_api
class GameItemStore = _GameItemStore with _$GameItemStore;

abstract class _GameItemStore with Store {
  @observable
  GameModel selectedGame = const GameModel(
    id: '',
    title: '',
    coverUrl: '',
    statusId: '',
  );

  /// Define o jogo selecionado na lista de pesquisa ao abrir o Dialog
  @action
  Future<bool> setCurrentGame(GameModel game, [int? newGameStatus]) async {
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
      return await changeGameStatus();
    }
    return false;
  }

  @action
  Future<bool> changeGameStatus() async {
    final user = AuthService().currentUser;

    if (user != null) {
      selectedGame = await GameService().getGameStatus(selectedGame, user);
      return true;
    }
    return false;
  }
}
