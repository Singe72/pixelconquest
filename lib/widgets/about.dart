import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.85),
          border: Border.all(color: Colors.white, width: 7),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF375E53).withOpacity(0.85),
                border: const Border(
                  bottom: BorderSide(color: Colors.white, width: 7.0),
                ),
              ),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  "À propos",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildParagraph(
                      title: "Introduction",
                      content:
                          "Pixel Conquest est un jeu multijoueur de conquête de territoires où la stratégie est la clé de la victoire. Agrandissez votre territoire, générez des unités et affrontez les autres joueurs dans un combat sans merci. Soyez le dernier joueur en vie pour gagner la partie.",
                    ),
                    _buildParagraph(
                      title: "Solde",
                      content:
                          "Votre solde, affiché sur votre territoire, augmente régulièrement jusqu'à un maximum fixé par la taille de votre territoire. Le solde détermine votre puissance en attaque comme en défense. Vous pouvez choisir le nombre d'unités que vous envoyez au combat en réglant la barre de pourcentage en bas de l'écran.",
                    ),
                    _buildParagraph(
                      title: "Bordures",
                      content:
                          "Il est essentiel de tenir compte des nations voisines lors de la conquête de nouveaux territoires, car il est parfois avantageux de conserver une nation intermédiaire faible entre vous et un ennemi puissant. Pour conquérir entièrement une nation, vos forces d'attaque doivent doubler les forces de défense de l'ennemi.",
                    ),
                    _buildParagraph(
                      title: "Revenu maximum",
                      content:
                          "Le solde maximum que vous pouvez atteindre est égal à 150 fois votre nombre de pixels. Lorsque ce nombre est atteint, votre solde devient rouge, ce qui indique que l'augmentation des revenus n'est possible que par l'expansion territoriale.",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildParagraph({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.blue,
              decoration: TextDecoration.none),
        ),
        const SizedBox(height: 16.0),
        Text(
          content,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              decoration: TextDecoration.none),
        ),
        const SizedBox(height: 32.0),
      ],
    );
  }
}
