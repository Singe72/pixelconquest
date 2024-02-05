import "package:flame/game.dart";
import "package:flutter/material.dart";
import "package:pixelconquest/main.dart";
import "package:pixelconquest/overlays/scoreboard.dart";
import "package:pixelconquest/pixelconquest_game.dart";
import "package:supabase_flutter/supabase_flutter.dart";

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
          print("Player ${data["name"]} already exists, skipping...");
        } else {
          print(error);
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
