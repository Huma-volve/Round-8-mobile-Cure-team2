import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextRich extends StatelessWidget {
  const CustomTextRich({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text.rich(TextSpan(
        text: 'Search by your location ',
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 7, 49, 56)),
        children: [
          TextSpan(
              text: '129,El-Nasr Street, Cairo',
              style: TextStyle(
                color: AppColors.info,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ))
        ]));
  }
}
