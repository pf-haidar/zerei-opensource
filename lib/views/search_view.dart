import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:zerei_opensource/widgets/searched_game_item.dart';
import 'package:zerei_opensource/core/store/search.store.dart';

// ignore: must_be_immutable
class SearchView extends StatelessWidget {
  SearchView({super.key});

  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<SearchStore>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Observer(
            builder: (_) => SizedBox(
              height: 50,
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: inputController,
                onSubmitted: (_) => store.getGames(store.gameName),
                onChanged: (value) => store.setGameName(value),
                decoration: InputDecoration(
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  suffixIcon: store.gameName == ''
                      ? null
                      : IconButton(
                          onPressed: () {
                            inputController.clear();
                            store.setGameName();
                          },
                          icon: const Icon(Icons.close),
                          color: Colors.white,
                        ),
                  label: const Text(
                    'Buscar',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  focusColor: const Color.fromARGB(255, 0, 120, 189),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  fillColor: Colors.blueGrey[800],
                  filled: true,
                ),
              ),
            ),
          ),
        ),
        Observer(
          builder: (_) => Expanded(
            child: (() {
              if (store.hasException) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Ocorreu um erro na busca!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Icon(
                      Icons.error_outline,
                      size: 40,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                );
              }
              if (store.searchedGames.isEmpty && !store.isGettingInfo) {
                return const Center(
                  child: Text(
                    'Nenhum resultado encontrado!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                );
              } else if (store.isGettingInfo) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                );
              } else {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: store.searchedGames.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: SearchedGameItem(
                        key: ValueKey(store.searchedGames[index].id),
                        game: store.searchedGames[index],
                      ),
                    );
                  }),
                );
              }
            }()),
          ),
        ),
      ],
    );
  }
}
