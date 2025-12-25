import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/core/routing/routes.dart';
import 'package:cure_team_2/features/profile/presentation/pages/widgets/edit_profile_button.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final monthController = TextEditingController();
  final yearController = TextEditingController();
  final cvvController = TextEditingController();

  bool showNumber = false;

  TextStyle get _labelStyle => TextStyle(
        fontFamily: AppTextStyles.montserratSmallCaption.fontFamily,
        fontSize: AppTextStyles.montserratSmallCaption.fontSize,
        fontWeight: AppTextStyles.montserratSmallCaption.fontWeight,
        color: const Color(0xff000000),
      );

  InputDecoration _inputDecoration(String hint, {Widget? suffix}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        fontFamily: AppTextStyles.montserratSmallCaption.fontFamily,
        fontSize: AppTextStyles.montserratSmallCaption.fontSize,
        fontWeight: AppTextStyles.montserratSmallCaption.fontWeight,
        color: const Color(0xff6d7379),
      ),
      border: InputBorder.none,
      suffixIcon: suffix,
    );
  }

  Widget _tile({required Widget child}) {
    return Container(
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: const Color(0xfff5f6f7),
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xff05162c)),
        ),
        centerTitle: true,
        title: Text(
          'Add New Card',
          style: TextStyle(
            fontFamily: AppTextStyles.georgiaH3.fontFamily,
            fontSize: AppTextStyles.georgiaH3.fontSize,
            fontWeight: AppTextStyles.georgiaH3.fontWeight,
            color: const Color(0xff000000),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          16.w,
          16.h,
          16.w,
          MediaQuery.of(context).viewInsets.bottom + 24.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.verticalSpace,
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                height: 234.h,
                width: double.infinity,
                child: CustomPaint(
                  painter: CardBackgroundPainter(),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20.h,
                        left: 20.w,
                        child: SvgPicture.asset(
                          'assets/icons/company logo.svg',
                          height: 24.h,
                        ),
                      ),
                      Positioned(
                        top: 20.h,
                        right: 20.w,
                        child: SvgPicture.asset(
                          'assets/icons/visa logo.svg',
                          height: 24.h,
                        ),
                      ),
                      Positioned(
                        top: 90.h,
                        left: 20.w,
                        child: Text(
                          numberController.text.isEmpty
                              ? '6789 4567 5432 8903'
                              : numberController.text,
                          style: GoogleFonts.inriaSans(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20.h,
                        left: 20.w,
                        child: Text(
                          nameController.text.isEmpty
                              ? 'Seif Mohamed'
                              : nameController.text,
                          style: TextStyle(
                            fontFamily:
                                AppTextStyles.montserratSubheading.fontFamily,
                            fontSize:
                                AppTextStyles.montserratSubheading.fontSize,
                            fontWeight:
                                AppTextStyles.montserratSubheading.fontWeight,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20.h,
                        right: 20.w,
                        child: Text(
                          '${monthController.text.isEmpty ? '12' : monthController.text}/${yearController.text.isEmpty ? '22' : yearController.text},',
                          style: GoogleFonts.inriaSans(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            32.verticalSpace,
            Text('Cardholder Name', style: _labelStyle),
            8.verticalSpace,
            _tile(
              child: TextField(
                controller: nameController,
                decoration: _inputDecoration('Cardholder Name'),
              ),
            ),
            16.verticalSpace,
            Text('Card Number', style: _labelStyle),
            8.verticalSpace,
            _tile(
              child: TextField(
                controller: numberController,
                obscureText: !showNumber,
                keyboardType: TextInputType.number,
                decoration: _inputDecoration(
                  'Card Number',
                  suffix: IconButton(
                    icon: Icon(
                      showNumber ? Icons.visibility_off : Icons.visibility,
                      color: const Color(0xff05162c),
                    ),
                    onPressed: () {
                      setState(() {
                        showNumber = !showNumber;
                      });
                    },
                  ),
                ),
              ),
            ),
            16.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Expiry Date', style: _labelStyle),
                      8.verticalSpace,
                      Container(
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: const Color(0xfff5f6f7),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: monthController,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: _inputDecoration('02'),
                              ),
                            ),
                            Container(
                              width: 1,
                              color: const Color(0xffd1d5db),
                            ),
                            Expanded(
                              child: TextField(
                                controller: yearController,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: _inputDecoration('12'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CVV Code',
                        style: _labelStyle,
                      ),
                      8.verticalSpace,
                      _tile(
                        child: TextField(
                          controller: cvvController,
                          obscureText: true,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: _inputDecoration('123'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            160.verticalSpace,
            EditProfileButton(
              onPressed: () {},
              text: 'Save',
            ),
          ],
        ),
      ),
    );
  }
}

class CardBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xff19D9C2), Color(0xff3B58E7)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
