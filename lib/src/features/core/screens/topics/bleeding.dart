import 'package:flutter/material.dart';

class Bleeding extends StatelessWidget {
  const Bleeding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bleeding')),
      body: const Center(child: Text('Bleeding content goes here')),
    );
  }
}
