import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pixelconquest/utils/random_color.dart';
import 'package:pixelconquest/widgets/button.dart';
import 'package:pixelconquest/widgets/color_select.dart';
import 'package:pixelconquest/widgets/text_input.dart';

class SelectionView extends StatefulWidget {
  const SelectionView({super.key});

  @override
  State<SelectionView> createState() => _SelectionViewState();
}

class _SelectionViewState extends State<SelectionView> {
  late List<Color> buttonColors;
  late List<TextEditingController> textControllers;

  @override
  void initState() {
    super.initState();
    // Initialisation des listes
    buttonColors = List.generate(4, (index) => generateRandomColor());
    textControllers = List.generate(
        4, (index) => TextEditingController()); // pour les contrôleurs de texte
  }

  List<double> extractRGBComponents(Color color) {
    return [
      color.red.toDouble(),
      color.green.toDouble(),
      color.blue.toDouble(),
    ];
  }

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
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 25, 0,
                          0), // Décalage de 15 pixels en haut et à gauche
                      child: Button(
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
                    ),
                    const SizedBox(height: 50),
                    Center(
                      child: Column(children: [
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Champ de saisie pour le nom du joueur
                                TextInput(
                                  controller: textControllers[i],
                                  hintText: "Joueur ${i + 1}",
                                  verticalPadding: 10.0,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5 -
                                          74 -
                                          20,
                                ),
                                const SizedBox(width: 20),
                                // Bouton de couleur cliquable qui fait apparaître le widget ColorSelect
                                Button(
                                  text: "",
                                  textSize: 0,
                                  backgroundColor: buttonColors[i],
                                  width: 74,
                                  height: 74,
                                  onPressed: () {
                                    final colorComponents =
                                        extractRGBComponents(buttonColors[i]);
                                    showDialog(
                                      context: context,
                                      builder: (context) => ColorSelect(
                                        text: "Joueur ${i + 1}",
                                        initialRed: colorComponents[0],
                                        initialGreen: colorComponents[1],
                                        initialBlue: colorComponents[2],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        const SizedBox(height: 50),
                        // Bouton "C'est parti !"
                        Button(
                          text: "C'est parti !",
                          textSize: 36,
                          backgroundColor: Colors.black,
                          opacity: 0.75,
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 120,
                          onPressed: () {
                            // Ajoutez ici la logique pour gérer le clic sur le bouton
                          },
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
