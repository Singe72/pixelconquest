import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double textSize;
  final Color backgroundColor;
  final double buttonWidth;
  final EdgeInsetsGeometry padding;

  const CustomButton({super.key, 
    required this.text,
    required this.onPressed,
    this.textSize = 16.0,
    this.backgroundColor = Colors.black,
    this.buttonWidth = double.infinity,
    this.padding = const EdgeInsets.all(16.0),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(color: Colors.white),
          ),
        ),
        child: Padding(
          padding: padding,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: textSize,
            ),
          ),
        ),
      ),
    );
  }
}
