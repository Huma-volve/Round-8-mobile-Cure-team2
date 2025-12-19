import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.onpressed,
    required this.bacgroundColor,
    required this.textButtonStyle,
  });

  final String? text;

  final VoidCallback onpressed;
  final Color bacgroundColor;
  final TextStyle textButtonStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: 165,
      height: 40,
      decoration: BoxDecoration(
        color: bacgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: AppColors.primary),
      ),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(side: BorderSide.none),
        onPressed: onpressed,
        child: Text(text!, style: textButtonStyle),
      ),
    );
  }
}
