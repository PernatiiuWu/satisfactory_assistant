import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event/event.dart';
import 'dart:developer' as developer;

class WikiFirebaseService {
  var ready = Event();
  bool isReady = false;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late Map<String, dynamic> map;

  WikiFirebaseService(){
    Init();
  }

  void Init() async{
    QuerySnapshot<Map<String, dynamic>>? querySnapshot;
    querySnapshot = await _firestore.collection("wiki").get();
    onFirebaseReady(querySnapshot);
  }

  void onFirebaseReady(QuerySnapshot<Map<String, dynamic>> snapshot) {
    map = snapshot.docs[0].data();
    isReady = true;
    ready.broadcast();
  }

  List<String> getGroups(String root ) {
    if (!isReady || !map.containsKey(root)) return [];

    Map<String, dynamic> groupMap = map[root] as Map<String, dynamic>;
    return  groupMap.keys.toList();
  }

  List<String> getSubgroups(String root,String group) {
    if (!isReady || !map.containsKey(root)) return [];

    Map<String, dynamic> groupMap = map[root] as Map<String, dynamic>;
    if (!groupMap.containsKey(group)) return [];

    Map<String, dynamic> subMap = groupMap[group] as Map<String, dynamic>;
    return subMap.keys.toList();
  }

  List<dynamic> getItems(String root,String group, String subgroup) {
    if (!isReady || !map.containsKey(root)) return [];

    var groupMap = map[root] as Map<String, dynamic>;
    if (!groupMap.containsKey(group)) return [];

    Map<String, dynamic> subMap = groupMap[group] as Map<String, dynamic>;
    if (!subMap.containsKey(subgroup)) return [];

    return subMap[subgroup];
  }
}
