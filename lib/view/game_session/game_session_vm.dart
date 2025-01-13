import 'package:flutter/material.dart';

enum GameMode {
  singlePlayer,
  twoPlayer;
}

enum Player {
  p1,
  p2;

  Color get color {
    return switch (this) {
      Player.p1 => Colors.red,
      Player.p2 => Colors.blue,
    };
  }
}

class GameOver {
  final Player? winner;

  GameOver(Player this.winner);
  GameOver.draw() : winner = null;
}

class GameSessionVm extends ChangeNotifier {
  var tiles = List<List<Player?>>.generate(
    3,
    growable: false,
    (i) {
      return List.generate(
        3,
        growable: false,
        (j) => null,
      );
    },
  );
  Player turn = Player.p1;
  GameOver? gameOver;

  void selectTile(int index) {
    if (index < 0 || index > 8) {
      throw Exception('Out of Bounds: $index. Expected: -1 < index < 9.');
    }
    if (gameOver != null) return;
    print(' \n$turn\nindex: $index -> tile [${index ~/ 3}][${index % 3}]');
    if (tiles[index ~/ 3][index % 3] == null) {
      tiles[index ~/ 3][index % 3] = turn;
      turn = Player.values.firstWhere((e) => e != turn);
    }
    gameOver = _isGameOver();
    print(' \nwinner: ${gameOver?.winner}');
    notifyListeners();
  }

  //TODO: Refactor and use List.every() and list.any() instead of nested loops.
  GameOver? _isGameOver() {
    bool noMoreEmptyTiles = true;

    print(' \n----- Checking Rows -----');
    outerLoop:
    for (var row = 0; row < tiles.length; row++) {
      Player? possibleWinner = tiles[row][0];
      for (var column = 0; column < tiles.length; column++) {
        print('Value at tile [$row][$column]: ${tiles[row][column]}');
        if (tiles[row][column] == null) {
          noMoreEmptyTiles = false;
          continue outerLoop;
        }
        if (tiles[row][column] != possibleWinner) {
          possibleWinner = null;
          break;
        }
      }
      if (possibleWinner != null) return GameOver(possibleWinner);
    }
    if (noMoreEmptyTiles) return GameOver.draw();

    print(' \n----- Checking Columns -----');
    outerLoop:
    for (var row = 0; row < tiles.length; row++) {
      Player? possibleWinner = tiles[0][row];
      for (var column = 0; column < tiles.length; column++) {
        print('Looking at tiles[$column][$row]: ${tiles[column][row]}');
        if (tiles[column][row] == null) {
          continue outerLoop;
        }
        if (tiles[column][row] != possibleWinner) {
          possibleWinner = null;
          break;
        }
      }
      if (possibleWinner != null) return GameOver(possibleWinner);
    }

    print(' \n----- Checking Main Diagonal -----');
    Player? possibleWinner = tiles[0][0];
    for (var i = 0; i < tiles.length; i++) {
      if (tiles[i][i] == null || tiles[i][i] != possibleWinner) {
        possibleWinner = null;
        break;
      }
    }
    if (possibleWinner != null) return GameOver(possibleWinner);

    //TODO: Check Secondary Diagonal.

    return null;
  }
}
