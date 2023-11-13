import 'package:flutter/material.dart';

import '../../services/firebase_service.dart';
import 'screen_pages/buildings_pages/buildings_group_page.dart';

enum WikiViewType { groups, subgroups, items }

class BuildingScreen extends StatefulWidget {
  WikiFirebaseService wikiFirebaseService;
  BuildingScreen(this.wikiFirebaseService, {super.key});

  @override
  State<BuildingScreen> createState() => _BuildingScreenState(wikiFirebaseService);
}

class _BuildingScreenState extends State<BuildingScreen> {
  late WikiFirebaseService wikiFirebaseService;

  WikiViewType wikiViewType = WikiViewType.groups;

  _BuildingScreenState(this.wikiFirebaseService){

  }
  void OnTap(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(255, 210, 157, 1),
        child:
          wikiFirebaseService.isReady? switch (wikiViewType) {
            WikiViewType.groups =>
                BuildingsGroup(groupsName: wikiFirebaseService.getGroups("buildings")),
            WikiViewType.subgroups =>
                BuildingsGroup(groupsName: wikiFirebaseService.getGroups("buildings")),
            WikiViewType.items =>
                BuildingsGroup(groupsName: wikiFirebaseService.getGroups("buildings")),
          }:Text("not ready"),
        // child: Text("fsdf"),
      ),
    );
  }
}
