import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyStyle = TextStyle(
      fontFamily: AppTextStyles.montserratButton.fontFamily,
      fontSize: AppTextStyles.montserratButton.fontSize,
      fontWeight: AppTextStyles.montserratButton.fontWeight,
      letterSpacing: 0,
      color: const Color(0xff6d7379),
    );
    final lastUpdatedStyle = TextStyle(
      fontFamily: AppTextStyles.georgiaSubheading.fontFamily,
      fontSize: AppTextStyles.georgiaSubheading.fontSize,
      fontWeight: AppTextStyles.georgiaSubheading.fontWeight,
      letterSpacing: 0,
      color: const Color(0xff05162c),
    );
    final termsStyle = TextStyle(
      fontFamily: AppTextStyles.georgiaH3.fontFamily,
      fontSize: AppTextStyles.georgiaH3.fontSize,
      fontWeight: AppTextStyles.georgiaH3.fontWeight,
      letterSpacing: 0,
      color: const Color(0xff000000),
    );

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
          "Privacy Policy",
          style: TextStyle(
            fontFamily: AppTextStyles.georgiaH3.fontFamily,
            fontSize: AppTextStyles.georgiaH3.fontSize,
            fontWeight: AppTextStyles.georgiaH3.fontWeight,
            color: const Color(0xff000000),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              40.verticalSpace,
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Last Updated: ',
                      style: lastUpdatedStyle,
                    ),
                    TextSpan(
                      text: '19/11/2024',
                      style: bodyStyle,
                    ),
                  ],
                ),
              ),
              10.verticalSpace,
              Text(
                'Welcome to Cure. Your privacy is important to us. This Privacy Policy explains how we collect, use, and protect '
                'your personal information when you use our doctor appointment booking app.',
                style: bodyStyle,
              ),
              40.verticalSpace,
              Text(
                'terms & conditions',
                style: termsStyle,
              ),
              10.verticalSpace,
              Text(
                'By registering, accessing, or using this app, you confirm that  you are at least 18 years old (or have parental/guardian consent if younger) '
                'and agree to be bound by these Terms and our Privacy Policy.',
                style: bodyStyle,
              ),
              5.verticalSpace,
              Text(
                'You agree to:',
                style: bodyStyle,
              ),
              _bullet(
                'Use the app only for lawful purposes.',
                bodyStyle,
              ),
              _bullet(
                'Provide accurate and complete information during registration and booking.',
                bodyStyle,
              ),
              _bullet(
                'Not impersonate others or create fake accounts.',
                bodyStyle,
              ),
              Text(
                'You may not:',
                style: bodyStyle,
              ),
              _bullet(
                'Disrupt or interfere with the app’s functionality.',
                bodyStyle,
              ),
              _bullet(
                'Try to access data or systems not meant for you.',
                bodyStyle,
              ),
              _bullet(
                'Use the app to harass or abuse doctors or staff.',
                bodyStyle,
              ),
              Text(
                'Your data is handled in accordance with our [Privacy Policy]. '
                'You are responsible for keeping your login credentials secure.',
                style: bodyStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bullet(String text, TextStyle style) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('  •  ', style: style),
        Expanded(
          child: Text(text, style: style),
        ),
      ],
    );
  }
}
