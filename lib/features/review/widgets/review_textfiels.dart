import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class ReviewTextFieldPart extends StatelessWidget {
  const ReviewTextFieldPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Your review',
              style: AppTextStyles.georgiaH3,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          width: double.infinity,
          child: TextField(
            textAlignVertical: TextAlignVertical.top,
            textAlign: TextAlign.start,
            maxLines: null,
            expands: true,
            decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                hintText: 'Write your review',
                hintStyle: AppTextStyles.montserratRegularSubheading),
          ),
        ),
      ],
    );
  }
}
