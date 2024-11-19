import 'package:flutter/material.dart';
import '../../constants/color.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final double? fontSize;
  final EdgeInsets? padding;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = CustomColor.primaryColor,
    this.textColor = CustomColor.backgroundColor,
    this.borderRadius = 8.0,
    this.fontSize = 16.0,
    this.padding = const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        padding: padding,
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
      ),
    );
  }
}
