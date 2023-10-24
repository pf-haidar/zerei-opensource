// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_item.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GameItemStore on _GameItemStore, Store {
  late final _$selectedGameAtom =
      Atom(name: '_GameItemStore.selectedGame', context: context);

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

  late final _$setCurrentGameAsyncAction =
      AsyncAction('_GameItemStore.setCurrentGame', context: context);

  @override
  Future<bool> setCurrentGame(GameModel game, [int? newGameStatus]) {
    return _$setCurrentGameAsyncAction
        .run(() => super.setCurrentGame(game, newGameStatus));
  }

  late final _$changeGameStatusAsyncAction =
      AsyncAction('_GameItemStore.changeGameStatus', context: context);

  @override
  Future<bool> changeGameStatus() {
    return _$changeGameStatusAsyncAction.run(() => super.changeGameStatus());
  }

  @override
  String toString() {
    return '''
selectedGame: ${selectedGame}
    ''';
  }
}
