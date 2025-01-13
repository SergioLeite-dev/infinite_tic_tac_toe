import 'package:flutter/material.dart';
import 'package:infinite_tic_tac_toe/view/game_session/game_session_vm.dart';

class GameSessionScreen extends StatelessWidget {
  final GameSessionVm viewModel;
  const GameSessionScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Game Screen"),
      ),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, snapshot) {
            return Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                children: List.generate(
                  9,
                  (index) {
                    final tile = viewModel.tiles[index ~/ 3][index % 3];
                    return GestureDetector(
                      onTap: () {
                        viewModel.selectTile(index);
                      },
                      child: Container(
                        color: tile?.color ?? Colors.grey,
                        child: Text('$index'),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
