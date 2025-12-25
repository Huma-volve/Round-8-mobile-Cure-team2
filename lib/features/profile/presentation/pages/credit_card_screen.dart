import 'package:cure_team_2/core/routing/routes.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/features/profile/presentation/pages/widgets/edit_profile_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreditCardScreen extends StatelessWidget {
  const CreditCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff05162c),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Credit / Debit Payment",
          style: TextStyle(
            fontFamily: AppTextStyles.georgiaH3.fontFamily,
            fontSize: AppTextStyles.georgiaH3.fontSize,
            fontWeight: AppTextStyles.georgiaH3.fontWeight,
            color: const Color(0xff000000),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 194),
            Center(
              child: Image.asset(
                'assets/images/credit-card.png',
                width: 200,
                height: 200,
              ),
            ),
            6.verticalSpace,
            Text(
              'Nothing to display here!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppTextStyles.georgiaH3.fontFamily,
                color: const Color(0xff000000),
                fontSize: AppTextStyles.georgiaH3.fontSize,
                fontWeight: AppTextStyles.georgiaH3.fontWeight,
              ),
            ),
            10.verticalSpace,
            Text(
              'Add your cards to make payment easier',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppTextStyles.montserratButton.fontFamily,
                fontSize: AppTextStyles.montserratButton.fontSize,
                fontWeight: AppTextStyles.montserratButton.fontWeight,
                color: const Color(0xff6d7379),
              ),
            ),
            256.verticalSpace,
            EditProfileButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.addCard);
              },
              text: 'Add Card',
              showPlus: true,
            ),
          ],
        ),
      ),
    );
  }
}
