import 'package:flutter/material.dart';
import 'package:pixelconquest/pages/selection_page.dart';
import 'package:pixelconquest/widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nom de votre jeu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              text: 'Jouer',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SelectionPage()), // Mise à jour ici
                );
              },
            ),
            const SizedBox(height: 20),
            // Autres boutons personnalisés ou widgets réutilisables
          ],
        ),
      ),
    );
  }
}