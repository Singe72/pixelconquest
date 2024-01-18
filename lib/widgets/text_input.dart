import "package:flutter/material.dart";

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double verticalPadding;
  final double horizontalPadding;

  const TextInput(
      {super.key,
      required this.controller,
      required this.hintText,
      this.verticalPadding = 0,
      this.horizontalPadding = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.white),
      ),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
