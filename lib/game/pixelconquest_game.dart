import "dart:math";

import "package:flame/game.dart";
import "package:flutter/material.dart";
import "package:pixelconquest/game/components/grid.dart";
import 'package:pixelconquest/game/components/player.dart';
import "package:pixelconquest/game/config/game_config.dart";
import "package:pixelconquest/game/config/styles.dart";

class PixelConquestGame extends FlameGame {
  final List gameData;
  final Random random = Random();
  PixelConquestGame({required this.gameData});
  Grid grid = Grid(
      rows: GameConfig.rows,
      cols: GameConfig.columns,
      cellSize: GameConfig.cellSize);

  @override
  Future<void> onLoad() async {
    for (var playerData in gameData) {
      String playerName = playerData["name"];
      Color playerColor = playerData["color"];

      double randomX = random.nextDouble() * size.x;
      double randomY = random.nextDouble() * size.y;

      Player player = Player(
          name: playerName,
          color: playerColor,
          position: Vector2(randomX, randomY));

      add(player);
      grid.spawnPlayer(5, 5);
      grid.spawnPlayer(GameConfig.rows - 6, 5);
      grid.spawnPlayer(5, GameConfig.columns - 6);
      grid.spawnPlayer(GameConfig.rows - 6, GameConfig.columns - 6);
    }
  }

  @override
  void render(Canvas canvas) {
    //drawGrid(canvas);
    grid.render(canvas);
    super.render(canvas);
  }

  void drawGrid(Canvas canvas) {
    const cellSize = 5;

    double startX = (canvasSize[0] - size.x) / 2;
    double startY = (canvasSize[1] - size.y) / 2;

    for (double i = startX; i <= startX + size.x; i += cellSize) {
      for (double j = startY; j <= startY + size.y; j += cellSize) {
        canvas.drawRect(
          Rect.fromPoints(
            Offset(i, j),
            Offset(i + cellSize, j + cellSize),
          ),
          Styles.land,
        );
      }
    }
  }
}
