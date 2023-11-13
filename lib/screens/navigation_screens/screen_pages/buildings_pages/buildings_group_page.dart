import 'package:event/event.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuildingsGroup extends StatelessWidget {
  Event itemTapped = Event();
  String selected="";

  List<String> groupsName;

  BuildingsGroup({super.key, required this.groupsName});

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 4
            ),
            itemCount: groupsName.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 46, 70, 59),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(groupsName[index],
                      style: const TextStyle(color: Colors.white)),
                ),
                onTap: () {
                  selected = groupsName[index];
                  itemTapped.broadcast();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
