import "dart:math";
import "package:flame/components.dart";
import "package:flame/events.dart";
import "package:flutter/material.dart";

class Player extends RectangleComponent with DragCallbacks {
  final String name;
  final Color color;
  int units;
  int cells;
  int maxUnits;
  int score;
  bool isDragging = false;

  Player({
    required this.name,
    required this.color,
    required super.position,
    this.units = 512,
    this.cells = 1,
    this.maxUnits = 512 * 150,
    this.score = 0,
  }) : super(
            paint: Paint()..color = color,
            size: Vector2.all(60),
            angle: pi / 4,
            anchor: Anchor.center);

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final Paint borderPaint = Paint()
      ..color = color.withOpacity(0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    canvas.drawRect(size.toRect(), borderPaint);

    final center = size / 2;
    final text = TextPainter(
      text: TextSpan(
        text: units.toString(),
        style: TextStyle(
          color: isDragging ? Colors.white : Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    text.layout();
    text.paint(
        canvas, center.toOffset() - Offset(text.width / 2, text.height / 2));
  }

  @override
  void update(double dt) {
    super.update(dt);
    recalculateMaxUnits();
    generateUnits();
  }

  @override
  void onDragStart(DragStartEvent event) {
    super.onDragStart(event);
    isDragging = true;
  }

  @override
  void onDragEnd(DragEndEvent event) {
    super.onDragEnd(event);
    isDragging = false;
  }

  void setScore(int newScore) {
    score = newScore;
  }

  void recalculateMaxUnits() {
    maxUnits = units * 150;
  }

  void generateUnits() {
    int newUnits = units + cells * 2;
    if (newUnits > maxUnits) {
      units = maxUnits;
    } else {
      units = newUnits;
    }
  }
}
