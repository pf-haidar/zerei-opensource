import 'package:mobx/mobx.dart';
import 'package:zerei_opensource/core/controllers/search_controller.dart';
import 'package:zerei_opensource/core/models/game_model.dart';
import 'package:zerei_opensource/core/services/auth/auth_service.dart';
import 'package:zerei_opensource/core/services/game/game_service.dart';

part 'search.store.g.dart';

// ignore: library_private_types_in_public_api
class SearchStore = _SearchStore with _$SearchStore;

abstract class _SearchStore with Store {
  final SearchController _controller = SearchController();

  @observable
  ObservableList<GameModel> searchedGames = ObservableList<GameModel>();

  @observable
  String gameName = '';

  @observable
  bool isGettingInfo = false;

  @observable
  bool hasException = false;

  /// Busca todos os jogos do usuário e faz a relação de ID com a API do IGDB.
  /// A relação de ID é feita caso um jogo tenha seu ID alterado.
  ///
  /// [tempGameList] contém todos os jogos obtidos pela API do IGDB.
  Future<List<GameModel>> getUserGames(List<GameModel> tempGameList) async {
    final user = AuthService().currentUser;
    List<GameModel> userGamesList = [];

    if (user != null) {
      userGamesList = await GameService().getUserGames(user);
    }

    for (var i = 0; i < userGamesList.length; i++) {
      for (var j = 0; j < tempGameList.length; j++) {
        if (userGamesList[i].id == tempGameList[j].id) {
          tempGameList[j] = userGamesList[i];
        }
      }
    }

    return tempGameList;
  }

  /// Adiciona todos os jogos a lista de pesquisa do App e chama a função [getUserGames]
  @action
  addGamesToSearch(List<GameModel> tempGameList) {
    getUserGames(tempGameList).then((newTempList) {
      searchedGames.addAll(newTempList);
    });
  }

  /// Limpa a lista de jogos pesquisados e atualiza o status do jogo que foi selecionado.
  /// Não é necessário fazer uma segunda consulta para API do IGDB.
  @action
  refreshGameList() async {
    try {
      print('entrou no refresh');
      final ObservableList<GameModel> newSearchedGames =
          ObservableList.of(await getUserGames(searchedGames));

      searchedGames.clear();
      Future.delayed(const Duration(milliseconds: 200),
          () => searchedGames.addAll(newSearchedGames));
    } catch (e) {
      hasException = true;
      print('erro no refresh --> $e');
    }
  }

  @action
  setGameName([String? gameName]) {
    this.gameName = gameName ?? '';
  }

  /// Obtem informações de games direto da API
  getGames(String gameName) async {
    searchedGames.clear();
    isGettingInfo = true;
    hasException = false;
    List<GameModel> tempGameList = [];
    try {
      List<dynamic> tempList =
          await _controller.getGamesList(gameName: gameName);
      for (var i = 0; i < tempList.length; i++) {
        String coverUrl = tempList[i]['cover'] == null
            ? 'voidUrl'
            : await _controller.getGameCover(gameId: tempList[i]['cover']);
        tempGameList.add(
          GameModel(
            id: tempList[i]['id'].toString(),
            statusId: null,
            title: tempList[i]['name'],
            coverUrl: coverUrl,
          ),
        );
      }
      addGamesToSearch(tempGameList);
    } catch (e) {
      hasException = true;
    } finally {
      isGettingInfo = false;
    }
  }


  @action
  clearSearchList(){
    searchedGames.clear();
  }
}
