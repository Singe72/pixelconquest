import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:pixelconquest/game/config/game_config.dart';
import 'package:pixelconquest/game/config/styles.dart';

enum CellType { land, water, mountain, occupied }

class Grid extends Component {
  final int rows;
  final int cols;
  final double cellSize;

  final cells = List.generate(
    GameConfig.rows,
    (i) => List.generate(
      GameConfig.columns,
      (j) => CellType.land,
    ),
  );

  Grid({required this.rows, required this.cols, required this.cellSize});

  @override
  void render(Canvas canvas) {
    drawGrid(canvas);
  }

  void drawGrid(canvas) {
    for (var i = 0; i < rows; i++) {
      for (var j = 0; j < cols; j++) {
        final cell = cells[i][j];
        final paint = cell == CellType.land
            ? Styles.land
            : cell == CellType.water
                ? Styles.water
                : Styles.mountain;

        canvas.drawRect(
          Rect.fromLTWH(
            j * cellSize,
            i * cellSize,
            cellSize,
            cellSize,
          ),
          paint,
        );
      }
    }
  }

  void spawnPlayer(int row, int col) {
    // Dessine une croix autour de la position du joueur
    cells[row][col] = CellType.occupied;
    cells[row - 2][col] = CellType.occupied;
    cells[row - 1][col] = CellType.occupied;
    cells[row + 1][col] = CellType.occupied;
    cells[row + 2][col] = CellType.occupied;
    cells[row][col - 2] = CellType.occupied;
    cells[row][col - 1] = CellType.occupied;
    cells[row][col + 1] = CellType.occupied;
    cells[row][col + 2] = CellType.occupied;
    cells[row - 1][col - 1] = CellType.occupied;
    cells[row - 1][col + 1] = CellType.occupied;
    cells[row + 1][col - 1] = CellType.occupied;
    cells[row + 1][col + 1] = CellType.occupied;
  }

  @override
  void update(double dt) {
    // Pas besoin de mettre à jour la grille
  }
}
