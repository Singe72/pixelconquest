import "package:flutter/material.dart";

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double verticalPadding;
  final double horizontalPadding;
  final double width;

  const TextInput(
      {super.key,
      required this.controller,
      required this.hintText,
      this.verticalPadding = 0,
      this.horizontalPadding = 0,
      this.width = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.white, width: 3),
      ),
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: horizontalPadding),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        cursorColor: Colors.white,
        style: const TextStyle(
            color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            border: InputBorder.none),
      ),
    );
  }
}
