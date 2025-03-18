import 'package:flutter/material.dart';
import 'package:flutter_firsts/screens/UberEats_Score.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: UberEatsScore());
  }
}
