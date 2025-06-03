import 'package:flutter/material.dart';

class DrugOverdose extends StatelessWidget {
  const DrugOverdose({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CPR Instructions')),
      body: const Center(child: Text('CPR content goes here')),
    );
  }
}