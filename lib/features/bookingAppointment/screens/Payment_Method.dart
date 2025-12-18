import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/features/bookingAppointment/widget/TotalPriceAndNavb.dart';
import 'package:cure_team_2/features/bookingAppointment/widget/card_Item.dart';
import 'package:cure_team_2/features/bookingAppointment/widget/customAppBar.dart';
import 'package:cure_team_2/features/bookingAppointment/widget/customDocInfo.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  final TextEditingController tController = TextEditingController();

  DateTime? selectedday = DateTime.now();
  DateTime focusedday = DateTime.now();
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    tController.text = DateFormat('EEEE MMMM d').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 28.w, left: 28.w, bottom: 5.w),
      decoration: const BoxDecoration(color: Colors.white),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(title: Text('Book Appointment')),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomDoctorInfo(),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Image.asset(
                    Assets.bookingicon,
                    color: AppColors.primary,
                    width: 16.w,
                    height: 16.h,
                  ),

                  SizedBox(width: 5.w),
                  Text(
                    'Friday,July17-4:00pm',
                    style: AppTextStyles.montserratSmallCaption,
                  ),
                  const Spacer(),
                  Text(
                    'Reschedule',
                    style: AppTextStyles.montserratCaption.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25.h),
              Text('Payment Method', style: AppTextStyles.georgiaSubheading),
              SizedBox(height: 10.h),
              CardItem(
                text: 'Credit Cart',
                chekIcon: Assets.checksolid,
                creditName: Assets.visa,
                isSelected: selectedIndex == 0,
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
              ),
              CardItem(
                text: 'PayPal',
                chekIcon: Assets.checkempty,
                creditName: Assets.paypal,
                isSelected: selectedIndex == 1,
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
              ),
              CardItem(
                text: 'Apple Pay',
                chekIcon: Assets.checkempty,
                creditName: Assets.pay,
                isSelected: selectedIndex == 2,
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                },
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {},
                child: DottedBorder(
                  dashPattern: const [11, 11],
                  color: AppColors.primary,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(8),
                  padding: EdgeInsets.only(
                    left: 12.w,
                    right: 16.w,
                    top: 8.h,
                    bottom: 8.h,
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Assets.plus),
                      Text(
                        'Add new card',
                        style: AppTextStyles.montserratH3.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        /// Bottom Bar
        bottomNavigationBar: Totalpriceandnavb(text: 'Continue to Pay', onPressed: () {  },),
      ),
    );
  }
}
