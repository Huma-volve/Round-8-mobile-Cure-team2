import 'package:cure_team_2/core/extensions/padding.dart';

import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingItemModel item;

  const OnBoardingItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(item.img, fit: BoxFit.scaleDown),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item.title,
              textAlign: TextAlign.center,
              style: AppTextStyles.georgiaH3,
            ),
            Text(
              item.description,
              textAlign: TextAlign.center,
              style: AppTextStyles.montserratButton,
            ).appPaddingVr(),
          ],
        ).appPaddingAll(24),
      ],
    );
  }
}

class OnBoardingItemModel {
  final String img;
  final String title;
  final String description;

  OnBoardingItemModel({
    required this.img,
    required this.title,
    required this.description,
  });
}
