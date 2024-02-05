import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pixelconquest/utils/random_color.dart';
import 'package:pixelconquest/views/game_view.dart';
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
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Initialisation des listes
    buttonColors = List.generate(4, (index) => generateRandomColor());
    textControllers = List.generate(
        4,
        (index) => TextEditingController(
            text: "Joueur ${index + 1}")); // pour les contrôleurs de texte
  }

  @override
  void dispose() {
    // Libération des ressources des contrôleurs de texte
    for (var controller in textControllers) {
      controller.dispose();
    }
    super.dispose();
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
                        Form(
                          key: _formKey,
                          child: Column(children: _buildFormFields()),
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

  List<Widget> _buildFormFields() {
    List<Widget> formFields = [];

    for (int i = 0; i < 4; i++) {
      formFields.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Champ de saisie pour le nom du joueur
            TextInput(
              controller: textControllers[i],
              hintText: "Joueur ${i + 1}",
              verticalPadding: 10.0,
              width: MediaQuery.of(context).size.width * 0.5 - 80 - 20,
              validator: (value) {
                int valueLength = value.length;
                if (valueLength < 3 || valueLength > 20) {
                  return "Le nom doit contenir entre 3 et 20 caractères";
                }
                return null;
              },
            ),
            const SizedBox(width: 20),
            // Bouton de couleur cliquable qui fait apparaître le widget ColorSelect
            Button(
              text: "",
              textSize: 0,
              backgroundColor: buttonColors[i],
              width: 80,
              height: 80,
              onPressed: () {
                final colorComponents = extractRGBComponents(buttonColors[i]);
                showDialog(
                  context: context,
                  builder: (context) => ColorSelect(
                    text: "Joueur ${i + 1}",
                    initialRed: colorComponents[0],
                    initialGreen: colorComponents[1],
                    initialBlue: colorComponents[2],
                    onColorChanged: (selectedColor) {
                      setState(() {
                        buttonColors[i] = selectedColor;
                      });
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ));
    }

    formFields.add(const SizedBox(height: 50));

    formFields.add(Button(
      text: "C'est parti !",
      textSize: 36,
      backgroundColor: Colors.black,
      opacity: 0.75,
      width: MediaQuery.of(context).size.width * 0.5,
      height: 120,
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          List playersData = [];

          for (int i = 0; i < 4; i++) {
            playersData.add(
                {"name": textControllers[i].text, "color": buttonColors[i]});
          }

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GameView(
                      gameData: playersData,
                    )),
          );
        }
      },
    ));

    return formFields;
  }
}
