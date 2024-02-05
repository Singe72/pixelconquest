import "dart:math";

import "package:flame/game.dart";
import "package:flutter/material.dart";
import "package:pixelconquest/components/player.dart";

class PixelConquestGame extends FlameGame {
  final List gameData;
  final Random random = Random();
  PixelConquestGame({required this.gameData});

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
    }
  }

  @override
  void render(Canvas canvas) {
    drawGrid(canvas);
    super.render(canvas);
  }

  void drawGrid(Canvas canvas) {
    const cellSize = 5;
    const strokeWidth = 0.1;

    Paint paint = Paint()
      ..color = const Color(0xFFA5927D)
      ..style = PaintingStyle.fill;

    double startX = (canvasSize[0] - size.x) / 2;
    double startY = (canvasSize[1] - size.y) / 2;

    for (double i = startX; i <= startX + size.x; i += cellSize) {
      for (double j = startY; j <= startY + size.y; j += cellSize) {
        canvas.drawRect(
          Rect.fromPoints(
            Offset(i + strokeWidth, j + strokeWidth),
            Offset(i + cellSize - strokeWidth, j + cellSize - strokeWidth),
          ),
          paint,
        );
      }
    }
  }
}
