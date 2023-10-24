// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_games_status.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyGamesStatusStore on _MyGamesStatusStore, Store {
  late final _$myGamesByStatusAtom =
      Atom(name: '_MyGamesStatusStore.myGamesByStatus', context: context);

  @override
  ObservableList<GameModel> get myGamesByStatus {
    _$myGamesByStatusAtom.reportRead();
    return super.myGamesByStatus;
  }

  @override
  set myGamesByStatus(ObservableList<GameModel> value) {
    _$myGamesByStatusAtom.reportWrite(value, super.myGamesByStatus, () {
      super.myGamesByStatus = value;
    });
  }

  late final _$selectedGameAtom =
      Atom(name: '_MyGamesStatusStore.selectedGame', context: context);

  @override
  GameModel get selectedGame {
    _$selectedGameAtom.reportRead();
    return super.selectedGame;
  }

  @override
  set selectedGame(GameModel value) {
    _$selectedGameAtom.reportWrite(value, super.selectedGame, () {
      super.selectedGame = value;
    });
  }

  late final _$changeGameStatusAsyncAction =
      AsyncAction('_MyGamesStatusStore.changeGameStatus', context: context);

  @override
  Future<void> changeGameStatus() {
    return _$changeGameStatusAsyncAction.run(() => super.changeGameStatus());
  }

  late final _$_MyGamesStatusStoreActionController =
      ActionController(name: '_MyGamesStatusStore', context: context);

  @override
  dynamic setCurrentGame(GameModel game, [int? newGameStatus]) {
    final _$actionInfo = _$_MyGamesStatusStoreActionController.startAction(
        name: '_MyGamesStatusStore.setCurrentGame');
    try {
      return super.setCurrentGame(game, newGameStatus);
    } finally {
      _$_MyGamesStatusStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
myGamesByStatus: ${myGamesByStatus},
selectedGame: ${selectedGame}
    ''';
  }
}
