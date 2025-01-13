import 'package:flutter/material.dart';
import 'package:infinite_tic_tac_toe/routing/routes.dart';
import 'package:infinite_tic_tac_toe/view/home/home_screen.dart';

void main() {
  runApp(const InfiniteTicTacToeApp());
}

class InfiniteTicTacToeApp extends StatelessWidget {
  const InfiniteTicTacToeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Infinite Tic Tac Toe',
      initialRoute: Routes.homeScreen.name,
      routes: {
        Routes.homeScreen.name: (context) => const HomeScreen(),
      },
    );
  }
}
