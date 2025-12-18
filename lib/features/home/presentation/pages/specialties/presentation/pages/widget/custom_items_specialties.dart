import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/widgets/spacing.dart';
import 'package:flutter/material.dart';

class CustomItemsSpecialties extends StatelessWidget {
  const CustomItemsSpecialties(
      {super.key,
      required this.text,
      required this.image,
      required this.horizontal,
      this.onTap});
  final String text;
  final String image;
  final double? horizontal;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: horizontal ?? 8),
        decoration: BoxDecoration(
          color: AppColors.primary50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 2, color: AppColors.grey400),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8,
          ),
          child: Column(
            children: [
              Image.asset(image),
              const VSpace(8),
              Text(
                text,
                style: const TextStyle(fontSize: 16, color: Color(0xFF05162C)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
