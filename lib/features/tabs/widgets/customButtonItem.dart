import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class custombuttonItem extends StatelessWidget {
  const custombuttonItem({
    super.key,
    required this.text,
    required this.onpressed,
  });

  final String text;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(8),
      width: 170,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1),
      ),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide.none,
        ),
        onPressed: onpressed,
        child: Text(text, style: AppTextStyles.montserratCaption.copyWith()),
      ),
    );
  }
}
