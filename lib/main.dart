import 'package:flutter/material.dart';
import 'package:zerei_opensource/core/store/game_item.store.dart';
import 'package:zerei_opensource/core/store/my_games_status.store.dart';
import 'package:zerei_opensource/core/store/search.store.dart';
import 'package:zerei_opensource/views/auth_or_app_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Zerei());
}

class Zerei extends StatefulWidget {
  const Zerei({super.key});

  @override
  State<Zerei> createState() => _ZereiState();
}

class _ZereiState extends State<Zerei> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SearchStore>(
          create: (_) => SearchStore(),
        ),
        Provider<GameItemStore>(
          create: (_) => GameItemStore(),
        ),
        Provider<MyGamesStatusStore>(
          create: (_) => MyGamesStatusStore(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromARGB(255, 0, 120, 189),
            secondary: const Color.fromARGB(255, 233, 162, 30),
          ),
          canvasColor: Colors.blueGrey[900],
          textTheme: ThemeData.light().textTheme.copyWith(
                titleLarge: const TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                ),
              ),
        ),
        home: const AuthOrAppView(),
      ),
    );
  }
}
