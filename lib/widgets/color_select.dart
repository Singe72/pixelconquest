import 'package:flutter/material.dart';

class ColorSelect extends StatefulWidget {
  final String text;
  final double initialRed;
  final double initialGreen;
  final double initialBlue;

  const ColorSelect({
    Key? key,
    required this.text,
    required this.initialRed,
    required this.initialGreen,
    required this.initialBlue,
  }) : super(key: key);

  @override
  State<ColorSelect> createState() => _ColorSelectState();
}

class _ColorSelectState extends State<ColorSelect> {
  late String _text;
  late double _currentSliderValueRed;
  late double _currentSliderValueGreen;
  late double _currentSliderValueBlue;

  @override
  void initState() {
    super.initState();
    _text = widget.text;
    _currentSliderValueRed = widget.initialRed;
    _currentSliderValueGreen = widget.initialGreen;
    _currentSliderValueBlue = widget.initialBlue;
  }

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
                  "Choisissez votre couleur !",
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
              // Utilise Expanded pour que le Container occupe tout l'espace disponible
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Premier enfant (1/4 de la largeur)
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(
                                  _currentSliderValueRed.round(),
                                  _currentSliderValueGreen.round(),
                                  _currentSliderValueBlue.round(),
                                  1,
                                ),
                                border:
                                    Border.all(color: Colors.white, width: 7),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: RotatedBox(
                                  quarterTurns: -1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      _text,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    // Deuxième enfant (3/4 de la largeur)
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Material(
                              color: Colors.transparent,
                              child: SliderTheme(
                                data: const SliderThemeData(
                                  activeTrackColor:
                                      Color.fromARGB(255, 150, 0, 0),
                                  inactiveTrackColor: Colors.black,
                                  thumbColor: Colors.transparent,
                                  thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 0,
                                  ),
                                  overlayColor: Colors.transparent,
                                  trackHeight: 166.0,
                                  trackShape: RectangularSliderTrackShape(),
                                  overlayShape:
                                      RoundSliderOverlayShape(overlayRadius: 0),
                                ),
                                child: SizedBox(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 7.0),
                                    ),
                                    child: Slider(
                                      value: _currentSliderValueRed,
                                      onChanged: (double value) {
                                        setState(() {
                                          _currentSliderValueRed = value;
                                        });
                                      },
                                      min: 0,
                                      max: 255,
                                      divisions: 255,
                                      label: _currentSliderValueRed
                                          .round()
                                          .toString(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Expanded(
                            child: Material(
                              color: Colors.transparent,
                              child: SliderTheme(
                                data: const SliderThemeData(
                                  activeTrackColor:
                                      Color.fromARGB(255, 0, 130, 0),
                                  inactiveTrackColor: Colors.black,
                                  thumbColor: Colors.transparent,
                                  thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 0,
                                  ),
                                  overlayColor: Colors.transparent,
                                  trackHeight: 166.0,
                                  trackShape: RectangularSliderTrackShape(),
                                  overlayShape:
                                      RoundSliderOverlayShape(overlayRadius: 0),
                                ),
                                child: SizedBox(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 7.0),
                                    ),
                                    child: Slider(
                                      value: _currentSliderValueGreen,
                                      onChanged: (double value) {
                                        setState(() {
                                          _currentSliderValueGreen = value;
                                        });
                                      },
                                      min: 0,
                                      max: 255,
                                      divisions: 255,
                                      label: _currentSliderValueGreen
                                          .round()
                                          .toString(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Expanded(
                            child: Material(
                              color: Colors.transparent,
                              child: SliderTheme(
                                data: const SliderThemeData(
                                  activeTrackColor:
                                      Color.fromARGB(255, 30, 30, 220),
                                  inactiveTrackColor: Colors.black,
                                  thumbColor: Colors.transparent,
                                  thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 0,
                                  ),
                                  overlayColor: Colors.transparent,
                                  trackHeight: 166.0,
                                  trackShape: RectangularSliderTrackShape(),
                                  overlayShape:
                                      RoundSliderOverlayShape(overlayRadius: 0),
                                ),
                                child: SizedBox(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 7.0),
                                    ),
                                    child: Slider(
                                      value: _currentSliderValueBlue,
                                      onChanged: (double value) {
                                        setState(() {
                                          _currentSliderValueBlue = value;
                                        });
                                      },
                                      min: 0,
                                      max: 255,
                                      divisions: 255,
                                      label: _currentSliderValueBlue
                                          .round()
                                          .toString(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
}
