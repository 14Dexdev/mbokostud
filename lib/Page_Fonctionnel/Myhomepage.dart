import 'package:flutter/material.dart';
import 'package:mbokostudy/Page_Fonctionnel/Acceuil.dart';
import 'package:mbokostudy/Page_Fonctionnel/ListAction/ListAction.dart';
import 'package:mbokostudy/Page_Fonctionnel/Livre.dart';
import 'package:mbokostudy/Page_Fonctionnel/Message.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // Index de l'onglet sélectionné

  // Liste des widgets à afficher pour chaque onglet
  static const List<Widget> _widgetOptions = <Widget>[
    Acceuil(),
    Livre(),
    Message(),
    Menu(),
  ];

  // Fonction pour gérer le changement d'onglet
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex), // Affiche le widget correspondant à l'onglet sélectionné
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 13,
          unselectedFontSize: 13,
          selectedItemColor: const Color.fromARGB(255, 134, 158, 254),
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 40,
                ),
                label: 'Home',
                tooltip: 'Decouvrez les couloir du Mboko'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu_book_outlined,
                  size: 40,
                ),
                label: 'Facilitateur',
                tooltip: 'Decouvrer les Exclusiviter du Mboko'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.bubble_chart_rounded,
                  size: 40,
                ),
                label: 'Messagerie',
                tooltip: 'Messagerie'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list_outlined,
                  size: 40,
                ),
                label: 'Menu',
                tooltip: 'Menu'),
          ],
        currentIndex: _selectedIndex, // Index de l'onglet actuellement sélectionné
         // Couleur de l'élément sélectionné
        onTap: _onItemTapped, // Fonction appelée lors d'un appui sur un onglet
      ),
    );
  }
}

