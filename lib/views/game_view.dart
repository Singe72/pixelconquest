import "package:flame/game.dart";
import "package:flutter/material.dart";
import "package:pixelconquest/main.dart";
import 'package:pixelconquest/game/overlays/scoreboard.dart';
import 'package:pixelconquest/game/pixelconquest_game.dart';
import "package:supabase_flutter/supabase_flutter.dart";
import 'package:logger/logger.dart';

var logger = Logger(
    filter: null,
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 50,
      colors: true,
      printEmojis: true,
      printTime: false,
    ),
    output: null);

class GameView extends StatefulWidget {
  final List gameData;
  const GameView({Key? key, required this.gameData}) : super(key: key);

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  Future<void> insertData(List gameData) async {
    for (var data in gameData) {
      try {
        await supabase.from("players").insert({
          "name": data["name"],
          "score": 0,
        });
      } catch (error) {
        if (error is PostgrestException && error.code == "23505") {
          logger.i("Player ${data["name"]} already exists, skipping...");
        } else {
          logger.e(error);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    insertData(widget.gameData);
    return GameWidget(
      game: PixelConquestGame(gameData: widget.gameData),
      overlayBuilderMap: {
        "ScoreboardOverlay": (BuildContext context, PixelConquestGame game) {
          return Scoreboard(game: game);
        }
      },
    );
  }
}
