import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zerei_opensource/core/models/game_model.dart';
import 'package:zerei_opensource/core/models/user_model.dart';
import 'package:zerei_opensource/core/services/game/game_service.dart';

class GameFirebaseService implements GameService {
  GameModel emptyModel = const GameModel(
    id: '',
    title: '',
    coverUrl: '',
    statusId: '',
  );

  @override
  Future<GameModel> getGameStatus(GameModel game, UserModel user) async {
    final firestore = FirebaseFirestore.instance;
    final docRef =
        firestore.collection('users').doc(user.id).collection('myGames');
    GameModel newGameModel = emptyModel;

    final querySnapshot = await docRef.where('id', isEqualTo: game.id).get();

    if (querySnapshot.docs.isNotEmpty) {
      print('JOGO EXISTE');
      final value = await updateGame(game, user);
      newGameModel = value;
    } else {
      final value = await addGame(game, user);
      newGameModel = value;
    }

    return newGameModel;
  }

  @override
  Future<GameModel> addGame(GameModel game, UserModel user) async {
    final firestore = FirebaseFirestore.instance;
    final subcollectionRef =
        firestore.collection('users').doc(user.id).collection('myGames');

    subcollectionRef.add(game.toJson()).then((newRef) {
      print('ADICIONADO');
      newRef.get().then((snapshot) {
        return _toAppGame(snapshot.data()!);
      });
    }).catchError((error) {
      print('Ocorreu um erro!');
    });

    return emptyModel;
  }

  @override
  Future<GameModel> updateGame(GameModel game, UserModel user) async {
    final firestore = FirebaseFirestore.instance;
    final querySnapshot = await firestore
        .collection('users')
        .doc(user.id)
        .collection('myGames')
        .where('id', isEqualTo: game.id)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final documentReference = querySnapshot.docs[0].reference;
      await documentReference.update(game.toJson());
      print('Jogo atualizado!');

      final updatedSnapshot = await documentReference.get();
      return updatedSnapshot.exists
          ? _toAppGame(updatedSnapshot.data()!)
          : emptyModel;
    } else {
      return emptyModel;
    }
  }

  @override
  Future<List<GameModel>> getUserGames(UserModel user) async {
    final firestore = FirebaseFirestore.instance;
    final subcollectionRef =
        firestore.collection('users').doc(user.id).collection('myGames');
    final List<GameModel> tempList = [];

    try {
      QuerySnapshot querySnapshot = await subcollectionRef.get();
      if (querySnapshot.docs.isNotEmpty) {
        querySnapshot.docs.forEach((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          tempList.add(_toAppGame(data));
        });
      } else {
        return tempList;
      }
    } catch (e) {
      print("Error on subcolletion: $e");
      return tempList;
    }
    return tempList;
  }

  @override
  Future<List<GameModel>> getUserGamesByStatus(
      UserModel user, String statusId) async {
    final firestore = FirebaseFirestore.instance;
    final subcollectionRef = firestore
        .collection('users')
        .doc(user.id)
        .collection('myGames')
        .where('statusId', isEqualTo: statusId);
    final List<GameModel> tempList = [];

    try {
      QuerySnapshot querySnapshot = await subcollectionRef.get();
      if (querySnapshot.docs.isNotEmpty) {
        querySnapshot.docs.forEach((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          tempList.add(_toAppGame(data));
        });
      } else {
        return tempList;
      }
    } catch (e) {
      print("Error on subcolletion: $e");
      return tempList;
    }
    return tempList;
  }

  GameModel _toAppGame(Map<String, dynamic> gameJson) {
    return GameModel(
      id: gameJson['id'],
      title: gameJson['title'],
      coverUrl: gameJson['coverUrl'],
      statusId: gameJson['statusId'],
      isCompleted: gameJson['isCompleted'],
    );
  }
}
