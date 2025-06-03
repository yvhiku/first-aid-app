import 'package:flutter/material.dart';

class HeadInjury extends StatelessWidget {
  const HeadInjury({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CPR Instructions')),
      body: const Center(child: Text('CPR content goes here')),
    );
  }
}