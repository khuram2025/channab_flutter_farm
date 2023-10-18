import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color borderColor;
  final Color textColor;
  final VoidCallback onTap;

  CustomButton({
    required this.buttonText,
    this.borderColor = Colors.green,
    this.textColor = Colors.green,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          buttonText,
          style: TextStyle(color: textColor, fontSize: 14),
        ),
      ),
    );
  }
}
