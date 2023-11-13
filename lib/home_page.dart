import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:satisfactory_assistant/screens/navigation_screens/buildings_screen.dart';
import 'package:satisfactory_assistant/screens/navigation_screens/flora_screen.dart';
import 'package:satisfactory_assistant/services/firebase_service.dart';
import 'package:satisfactory_assistant/shareds/custom_icons.dart';
import 'package:satisfactory_assistant/screens/navigation_screens/items_screen.dart';

import 'screens/navigation_screens/fauna_screen.dart';

class HomePage extends StatefulWidget {
  late WikiFirebaseService wikiFirebaseService;

  HomePage({super.key}){
    wikiFirebaseService= WikiFirebaseService();
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  _HomePageState();
  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      BuildingScreen(widget.wikiFirebaseService),
      const ItemsScreen(),
      const FloraScreen(),
      const FaunaScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 210, 157, 1),
        body: screens[currentIndex],
        bottomNavigationBar: GNav(
            onTabChange: (index) => setState(() {
                  currentIndex = index;
                }),
            gap: 8,
            tabs: const [
              GButton(
                icon: CustomIcons.buildings,
                text: "Buildings",
              ),
              GButton(
                icon: CustomIcons.items,
                text: "Items",
              ),
              GButton(
                icon: CustomIcons.flora,
                text: "Flora",
              ),
              GButton(
                icon: CustomIcons.fauna,
                text: "Fauna",
              )
            ]));
  }
}
