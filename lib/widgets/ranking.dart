import "package:flutter/material.dart";

class Ranking extends StatelessWidget {
  const Ranking({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
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
                border: const Border(bottom: BorderSide(color: Colors.white, width: 7.0))
              ),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  "Meilleurs Joueurs",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Expanded( // Utilisez Expanded pour que le SingleChildScrollView puisse s'étendre dans l'espace disponible
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: const Text("Classement")
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
