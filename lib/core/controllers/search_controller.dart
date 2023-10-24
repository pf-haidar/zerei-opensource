import 'dart:convert';

import 'package:http/http.dart' as http;

class SearchController {
  static const apiUrl = String.fromEnvironment("apiUrl");
  static const clientId = String.fromEnvironment("clientId");
  static const token = String.fromEnvironment("apiToken");

  /// Utiliza uma String com o nome do jogo para realizar busca.
  /// Retorna o nome, id da capa e id do 'jogo pai' em caso de ser uma DLC
  Future<List<dynamic>> getGamesList({required String gameName}) async {
    try {
      return await http
          .post(Uri.parse('$apiUrl/games'),
              headers: {
                "Accept": "*/*",
                "Client-ID": clientId,
                "Authorization": token
              },
              body:
                  'fields name, cover, parent_game; search "$gameName"; where version_parent = null;')
          .then(
        (http.Response response) {
          switch (response.statusCode) {
            case 200:
              return jsonDecode(response.body);
            default:
              return [];
          }
        },
      ).timeout(
        const Duration(seconds: 15),
        onTimeout: () {
          throw Exception();
        },
      );
    } on Exception catch (_) {
      rethrow;
    }
  }

  /// Utiliza o ID do game para buscar as URLs das capas.
  /// Para buscar uma imagem maior da capa, realiza um replace de parametro e concatena
  /// com 'https://' para poder utilizar a URL
  ///
  /// Em caso de erro, retorna uma String 'voidUrl' para utilizar imagem padrão.
  Future<String> getGameCover({required int gameId}) async {
    try {
      return await http
          .post(Uri.parse('$apiUrl/covers'),
              headers: {
                "Accept": "*/*",
                "Client-ID": clientId,
                "Authorization": ""
              },
              body: 'fields url; where id = $gameId;')
          .then(
        (http.Response response) {
          switch (response.statusCode) {
            case 200:
              var resp = jsonDecode(response.body);
              String url = resp[0]['url']
                  .substring(2)
                  .replaceAll('t_thumb', 't_cover_big');
              url = 'https://$url';
              return url;
            default:
              return 'voidUrl';
          }
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          return 'voidUrl';
        },
      );
    } catch (e) {
      return 'voidUrl';
    }
  }
}
