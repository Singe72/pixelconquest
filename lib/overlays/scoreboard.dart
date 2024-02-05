import 'package:flutter/material.dart';
import 'package:pixelconquest/pixelconquest_game.dart';

class Scoreboard extends StatelessWidget {
  final PixelConquestGame game;
  const Scoreboard({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return const Text("Scoreboard", style: TextStyle(color: Colors.white));
  }
}
