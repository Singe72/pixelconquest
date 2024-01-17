import "dart:ui";
import "package:flutter/material.dart";
import "package:pixelconquest/utils/random_color.dart";
import "package:pixelconquest/widgets/button.dart";
import "package:pixelconquest/widgets/text_input.dart";

class SelectionView extends StatelessWidget {
  const SelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/app_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.black.withOpacity(0.35),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                    text: "Retour",
                    textSize: 30,
                    backgroundColor: Colors.black,
                    opacity: 0.75,
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: 70,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 100),
                  const Text(
                    "Pixel Conquest",
                    style: TextStyle(
                      fontSize: 72,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 50),
                  // 4 lignes avec champs de saisie et carré de couleur
                  for (int i = 0; i < 4; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        children: [
                          // Champ de saisie pour le nom du joueur
                          Expanded(
                            child: TextInput(
                              controller: TextEditingController(),
                              hintText: "Joueur ${i + 1}",
                            ),
                          ),
                          const SizedBox(width: 20),
                          // Carré de couleur aléatoire
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: generateRandomColor(),
                              border: Border.all(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 50),
                  // Bouton "C"est parti !"
                  Button(
                    text: "C'est parti !",
                    textSize: 30,
                    backgroundColor: Colors.black,
                    opacity: 0.75,
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: 70,
                    onPressed: () {
                      // Ajoutez ici la logique pour gérer le clic sur le bouton
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
