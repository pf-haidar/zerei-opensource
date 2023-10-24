// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchStore on _SearchStore, Store {
  late final _$searchedGamesAtom =
      Atom(name: '_SearchStore.searchedGames', context: context);

  @override
  ObservableList<GameModel> get searchedGames {
    _$searchedGamesAtom.reportRead();
    return super.searchedGames;
  }

  @override
  set searchedGames(ObservableList<GameModel> value) {
    _$searchedGamesAtom.reportWrite(value, super.searchedGames, () {
      super.searchedGames = value;
    });
  }

  late final _$gameNameAtom =
      Atom(name: '_SearchStore.gameName', context: context);

  @override
  String get gameName {
    _$gameNameAtom.reportRead();
    return super.gameName;
  }

  @override
  set gameName(String value) {
    _$gameNameAtom.reportWrite(value, super.gameName, () {
      super.gameName = value;
    });
  }

  late final _$isGettingInfoAtom =
      Atom(name: '_SearchStore.isGettingInfo', context: context);

  @override
  bool get isGettingInfo {
    _$isGettingInfoAtom.reportRead();
    return super.isGettingInfo;
  }

  @override
  set isGettingInfo(bool value) {
    _$isGettingInfoAtom.reportWrite(value, super.isGettingInfo, () {
      super.isGettingInfo = value;
    });
  }

  late final _$hasExceptionAtom =
      Atom(name: '_SearchStore.hasException', context: context);

  @override
  bool get hasException {
    _$hasExceptionAtom.reportRead();
    return super.hasException;
  }

  @override
  set hasException(bool value) {
    _$hasExceptionAtom.reportWrite(value, super.hasException, () {
      super.hasException = value;
    });
  }

  late final _$refreshGameListAsyncAction =
      AsyncAction('_SearchStore.refreshGameList', context: context);

  @override
  Future refreshGameList() {
    return _$refreshGameListAsyncAction.run(() => super.refreshGameList());
  }

  late final _$_SearchStoreActionController =
      ActionController(name: '_SearchStore', context: context);

  @override
  dynamic addGamesToSearch(List<GameModel> tempGameList) {
    final _$actionInfo = _$_SearchStoreActionController.startAction(
        name: '_SearchStore.addGamesToSearch');
    try {
      return super.addGamesToSearch(tempGameList);
    } finally {
      _$_SearchStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setGameName([String? gameName]) {
    final _$actionInfo = _$_SearchStoreActionController.startAction(
        name: '_SearchStore.setGameName');
    try {
      return super.setGameName(gameName);
    } finally {
      _$_SearchStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchedGames: ${searchedGames},
gameName: ${gameName},
isGettingInfo: ${isGettingInfo},
hasException: ${hasException}
    ''';
  }
}
