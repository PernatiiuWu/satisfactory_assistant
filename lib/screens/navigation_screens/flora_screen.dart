import 'package:flutter/material.dart';

class FloraScreen extends StatelessWidget {
  const FloraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(255, 210, 157, 1),
        child: const Center(
          child: Text("Im Flora"),
        ),
      ),
    );
  }
}
