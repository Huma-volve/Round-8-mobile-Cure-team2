import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.onpressed,

    required this.isSelected,
  });

  final String? text;

  final VoidCallback onpressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: 165,
      height: 40,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: AppColors.grey),
      ),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide.none,
        ),
        onPressed: onpressed,
        child: Text(
          text!,
          style: AppTextStyles.montserratCaption.copyWith(
            color: isSelected ? Colors.white : AppColors.grey,
          ),
        ),
      ),
    );
  }
}
