import 'package:flutter/material.dart';
import 'package:zerei_opensource/views/home_view.dart';
import 'package:zerei_opensource/views/search_view.dart';
import 'package:zerei_opensource/views/settings_view.dart';
import 'package:zerei_opensource/views/my_games_view.dart';

class TabsView extends StatefulWidget {
  const TabsView({super.key});

  @override
  State<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  int _selectedScreenIndex = 0;
  late List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {'title': 'Home', 'screen': const HomeView()},
      {'title': 'Buscar', 'screen': SearchView()},
      {'title': 'Meus Jogos', 'screen': const MyGamesView()},
      {'title': 'Configurações', 'screen': const SettingsView()}
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _screens[_selectedScreenIndex]['screen'] as Widget,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        onTap: _selectScreen,
        currentIndex: _selectedScreenIndex,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.blueGrey[900],
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: _screens[0]['title'].toString(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: _screens[1]['title'].toString(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.games),
            label: _screens[2]['title'].toString(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: _screens[3]['title'].toString(),
          ),
        ],
      ),
    );
  }
}
