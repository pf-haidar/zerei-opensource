import 'package:zerei_opensource/core/models/game_model.dart';
import 'package:zerei_opensource/core/models/user_model.dart';
import 'package:zerei_opensource/core/services/game/game_firebase_service.dart';

abstract class GameService {

  Future<GameModel> getGameStatus(GameModel game, UserModel user);

  Future<GameModel> addGame(GameModel game, UserModel user);

  Future<GameModel> updateGame(GameModel game, UserModel user);

  Future<List<GameModel>> getUserGames(UserModel user);

  Future<List<GameModel>> getUserGamesByStatus(UserModel user, String statusId);

  factory GameService() {
    return GameFirebaseService();
  }
}
