import 'package:flutter/material.dart';
import 'package:infinite_tic_tac_toe/routing/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  Routes.gameSessionScreen.route(null),
                );
              },
              child: const Text('Play'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Rules'),
            ),
          ],
        ),
      ),
    );
  }
}
