import "dart:ui";
import "package:flutter/material.dart";
import "package:pixelconquest/widgets/custom_button.dart";

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
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Flou gaussien
              child: Container(
                color: Colors.black.withOpacity(0.35), // Assombrir de 35%
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        text: "Retour",
                        textSize: 30,
                        backgroundColor: Colors.black,
                        opacity: 0.75,
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: 70,
                        onPressed: () {
                          Navigator.pop(context);
                        }
                      ),
                      const SizedBox(height: 100),
                      const Text("Pixel Conquest",
                          style: TextStyle(
                            fontSize: 72,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          )),
                      const SizedBox(height: 100),
                      
                    
                      // Autres boutons personnalisés ou widgets réutilisables
                    ],
                  ),
                ),
              ))),
    );
  }
}
