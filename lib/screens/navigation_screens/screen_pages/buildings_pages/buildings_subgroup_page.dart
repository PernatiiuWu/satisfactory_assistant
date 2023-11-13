import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuildingsGroup extends StatelessWidget {
  List<String> groupsName = ["A", "B", "C"];
  BuildingsGroup({super.key, required this.groupsName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8),
          itemCount: groupsName.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 46, 70, 59),
                  borderRadius: BorderRadius.circular(20)),
              child: Text(groupsName[index],
                  style: const TextStyle(color: Colors.white)),
            );
          },
        ),
      ),
    );
  }
}
