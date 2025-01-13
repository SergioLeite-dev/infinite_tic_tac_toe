import 'package:flutter/material.dart';
import 'package:infinite_tic_tac_toe/view/game_session/game_session_screen.dart';
import 'package:infinite_tic_tac_toe/view/game_session/game_session_vm.dart';
import 'package:infinite_tic_tac_toe/view/home/home_screen.dart';

enum Routes<T> {
  homeScreen<Null>(),
  gameSessionScreen<Null>();

  RouteSettings get _settings => RouteSettings(name: name);

  MaterialPageRoute<K> route<K>(T arg) {
    switch (this) {
      case homeScreen:
        return MaterialPageRoute<K>(
          builder: (context) => const HomeScreen(),
          settings: _settings,
        );
      case gameSessionScreen:
        return MaterialPageRoute<K>(
          builder: (context) => GameSessionScreen(
            viewModel: GameSessionVm(),
          ),
          settings: _settings,
        );
    }
  }
}
