import "package:flutter/material.dart";

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double textSize;
  final Color backgroundColor;
  final double opacity;
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.textSize = 16.0,
    this.backgroundColor = Colors.black,
    this.opacity = 1,
    this.width = double.infinity,
    this.height = 20,
    this.padding = const EdgeInsets.all(16.0),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: backgroundColor.withOpacity(opacity),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: Padding(
          padding: padding,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: textSize,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
