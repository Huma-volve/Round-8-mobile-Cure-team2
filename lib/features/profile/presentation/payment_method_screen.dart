import 'package:cure_team_2/core/routing/routes.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/features/profile/presentation/pages/widgets/profile_tile.dart';
import 'package:cure_team_2/features/profile/presentation/pages/widgets/wallet_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String? selectedWallet;

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
          "Payment Method",
          style: TextStyle(
            fontFamily: AppTextStyles.georgiaH3.fontFamily,
            fontSize: AppTextStyles.georgiaH3.fontSize,
            fontWeight: AppTextStyles.georgiaH3.fontWeight,
            color: const Color(0xff000000),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            40.verticalSpace,
            Text(
              "Credit / Debit Card",
              style: TextStyle(
                fontFamily: AppTextStyles.georgiaSubheading.fontFamily,
                fontSize: AppTextStyles.georgiaSubheading.fontSize,
                fontWeight: AppTextStyles.georgiaSubheading.fontWeight,
                color: const Color(0xff000000),
              ),
            ),
            24.verticalSpace,
            ProfileTile(
              leading: SvgPicture.asset(
                'assets/icons/visa.svg',
                width: 24.w,
                height: 24.h,
              ),
              title: 'VISA',
              textStyle: TextStyle(
                fontFamily: AppTextStyles.montserratButton.fontFamily,
                fontSize: AppTextStyles.montserratButton.fontSize,
                fontWeight: AppTextStyles.montserratButton.fontWeight,
                color: const Color(0xff05162c),
              ),
              onTap: () {
                Navigator.pushNamed(context, Routes.creditCard);
              },
            ),
            16.verticalSpace,
            ProfileTile(
              leading: SvgPicture.asset(
                'assets/icons/mastercard.svg',
                width: 24.w,
                height: 18.h,
              ),
              title: 'MasterCard',
              textStyle: TextStyle(
                fontFamily: AppTextStyles.montserratButton.fontFamily,
                fontSize: AppTextStyles.montserratButton.fontSize,
                fontWeight: AppTextStyles.montserratButton.fontWeight,
                color: const Color(0xff05162c),
              ),
              onTap: () {
                Navigator.pushNamed(context, Routes.creditCard);
              },
            ),
            32.verticalSpace,
            Text(
              "Mobile Wallets",
              style: TextStyle(
                fontFamily: AppTextStyles.georgiaSubheading.fontFamily,
                fontSize: AppTextStyles.georgiaSubheading.fontSize,
                fontWeight: AppTextStyles.georgiaSubheading.fontWeight,
                color: const Color(0xff000000),
              ),
            ),
            24.verticalSpace,
            WalletTile(
              leading: SvgPicture.asset(
                'assets/icons/apple_pay.svg',
                width: 24.w,
                height: 9.h,
              ),
              title: 'Apple Pay',
              isSelected: selectedWallet == 'apple_pay',
              onTap: () {
                setState(() {
                  selectedWallet = 'apple_pay';
                });
              },
            ),
            16.verticalSpace,
            WalletTile(
              leading: SvgPicture.asset(
                'assets/icons/paypal.svg',
                width: 24.w,
                height: 24.h,
              ),
              title: 'PayPal',
              isSelected: selectedWallet == 'paypal',
              onTap: () {
                setState(() {
                  selectedWallet = 'paypal';
                });
              },
            ),
            32.verticalSpace,
            Text(
              "Cash",
              style: TextStyle(
                fontFamily: AppTextStyles.georgiaSubheading.fontFamily,
                fontSize: AppTextStyles.georgiaSubheading.fontSize,
                fontWeight: AppTextStyles.georgiaSubheading.fontWeight,
                color: const Color(0xff000000),
              ),
            ),
            24.verticalSpace,
            WalletTile(
              leading: Image.asset(
                'assets/images/cash.png',
                width: 24.w,
                height: 24.h,
                fit: BoxFit.contain,
              ),
              title: 'Cash',
              isSelected: selectedWallet == 'cash',
              onTap: () {
                setState(() {
                  selectedWallet = 'cash';
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
