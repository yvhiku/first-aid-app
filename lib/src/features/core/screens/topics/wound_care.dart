import 'package:flutter/material.dart';

class WoundCare extends StatelessWidget {
  const WoundCare({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CPR Instructions')),
      body: const Center(child: Text('CPR content goes here')),
    );
  }
}