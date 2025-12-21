import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/features/tabs/widgets/CustomOutlinedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBookingItem extends StatefulWidget {
  const MyBookingItem({
    super.key,
    required this.statusOntap,
    required this.statusText,
    required this.statuscolor,

    required this.onpressedButtonleft,
    required this.onpressedButtonright,
    required this.TextButton1,
    required this.TextButton2,
  });
  final VoidCallback statusOntap;
  final VoidCallback onpressedButtonleft;
  final VoidCallback onpressedButtonright;

  final String statusText;
  final String TextButton1;
  final String TextButton2;
  final Color statuscolor;
  @override
  State<MyBookingItem> createState() => _MyBookingItemState();
}

class _MyBookingItemState extends State<MyBookingItem> {
  int _selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 16.h, right: 10, left: 10, top: 10),
      width: 396.w,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(width: 1, color: AppColors.grey50),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Image.asset(Assets.bookingicon, width: 24.w, height: 24.h),
              const SizedBox(width: 5),
              Text(
                'Monday, July 21 - 11:00 Am',
                style: AppTextStyles.montserratButton,
              ),
              const Spacer(),
              GestureDetector(
                onTap: widget.statusOntap,
                child: Text(
                  widget.statusText,
                  style: AppTextStyles.montserratRegularCaption.copyWith(
                    color: widget.statuscolor,
                  ),
                ),
              ),
            ],
          ),
          Divider(endIndent: 5.w, indent: 5.w, color: AppColors.grey50),
          Row(
            children: [
              const CircleAvatar(backgroundImage: AssetImage(Assets.boy)),
              SizedBox(width: 5.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Jennifer Miller', style: AppTextStyles.georgiaButton),
                  Text(
                    'Psychiatrist',
                    style: AppTextStyles.montserratCaption.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Image.asset(
                Assets.location,
                width: 20.w,
                height: 20.h,
                color: AppColors.grey,
              ),
              Text(
                '129,El-Nasr Street, Cairo, Egypt ',
                style: AppTextStyles.montserratCaption.copyWith(
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomOutlinedButton(
                text: 'Cancel',
                onpressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                bacgroundColor: AppColors.background,
                textButtonStyle: AppTextStyles.chatSubtitle,
                IsSelected: _selectedIndex == 0,
              ),
              SizedBox(width: 10.w),
              CustomOutlinedButton(
                text: 'Reschedule',
                onpressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                IsSelected: _selectedIndex == 1,

                bacgroundColor: Colors.transparent,
                textButtonStyle: AppTextStyles.montserratRegularCaption,
              ),
              SizedBox(width: 10.w),
              CustomOutlinedButton(
                text: widget.TextButton2,
                onpressed: widget.onpressedButtonright,
                bacgroundColor: AppColors.primary,
                textButtonStyle: AppTextStyles.montserratRegularCaption
                    .copyWith(color: Colors.white),
                IsSelected: _selectedIndex == 2,
                
              ),
            ],
          ),
        ],
      ),
    );
  }
}
