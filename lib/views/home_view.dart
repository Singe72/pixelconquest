import "dart:ui";
import "package:flutter/material.dart";
import "package:pixelconquest/views/selection_view.dart";
import "package:pixelconquest/widgets/about.dart";
import "package:pixelconquest/widgets/custom_button.dart";
import "package:pixelconquest/widgets/ranking.dart";

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  Future<void> _showRanking(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const Ranking();
      },
    );
  }

  Future<void> _showAbout(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const About();
      },
    );
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
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Flou gaussien
              child: Container(
                color: Colors.black.withOpacity(0.35), // Opacité de 35%
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Pixel Conquest",
                          style: TextStyle(
                            fontSize: 72,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          )),
                      const SizedBox(height: 100),
                      CustomButton(
                        text: "Jouer",
                        textSize: 45,
                        backgroundColor: const Color(0xFF187500),
                        opacity: 0.75,
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.15,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SelectionView()),
                          );
                        },
                      ),
                      const SizedBox(height: 50),
                      CustomButton(
                        text: "Classement",
                        textSize: 45,
                        backgroundColor: Colors.black,
                        opacity: 0.75,
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.1,
                        onPressed: () {
                          _showRanking(context);
                        }
                      ),
                      const SizedBox(height: 50),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CustomButton(
                          text: "?",
                          textSize: 75,
                          backgroundColor: Colors.black,
                          opacity: 0.75,
                          width: 150,
                          height: 150,
                          onPressed: () {
                            _showAbout(context);
                          },
                        ),
                      ),
                      // Autres boutons personnalisés ou widgets réutilisables
                    ],
                  ),
                ),
              ))),
    );
  }
}
