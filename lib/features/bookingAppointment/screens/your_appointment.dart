import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/core/widgets/app_button.dart';
import 'package:cure_team_2/core/widgets/app_text_field.dart';
import 'package:cure_team_2/features/bookingAppointment/screens/Customdialoge.dart';
import 'package:cure_team_2/features/bookingAppointment/widget/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YourAppointment extends StatefulWidget {
  const YourAppointment({super.key});

  @override
  State<YourAppointment> createState() => _YourAppointmentState();
}

class _YourAppointmentState extends State<YourAppointment> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final List<String> times = [
      '9:00 AM',
      '10:00AM',
      '11:00AM',
      '12:30AM',
      '4:00 PM',
      '5:30 PM',
      '7:00 PM',
      '9:00 PM',
      '10:00PM',
    ];
    return Scaffold(
      appBar: const CustomAppBar(title: 'Your Appointment'),

      body: Container(
        margin: EdgeInsets.only(left: 16.w, right: 16.w),
        width: 396.w,
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Container(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              decoration: BoxDecoration(
                color: AppColors.warning50,
                borderRadius: BorderRadius.circular(5),
              ),

              // height: 50.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.warningicon),
                  SizedBox(width: 10.w),
                  Text(
                    "Cancellation must be made at least 24 hours in \n"
                    " advance to receive a refund",
                    style: AppTextStyles.montserratCaption.copyWith(
                      color: AppColors.warning,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.bookingicon,
                  width: 24.w,
                  height: 24.h,
                  color: AppColors.secondary600,
                ),
                const SizedBox(width: 5),
                Text(
                  'Monday, July 21 - 11:00 Am',
                  style: AppTextStyles.montserratButton.copyWith(
                    color: AppColors.secondary600,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Upcoming',
                    style: AppTextStyles.montserratCaption.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(Assets.boy),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jennifer Miller',
                      style: AppTextStyles.georgiaSubheading,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      ' Psychiatrist',
                      style: AppTextStyles.montserratButton.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Image.asset(Assets.chaticon, color: AppColors.secondary600),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Image.asset(
                  Assets.location,
                  color: AppColors.grey,
                  width: 20,
                  height: 20,
                ),
                Text(
                  '129,El-Nasr Street, Cairo, Egypt ',
                  style: AppTextStyles.montserratButton.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            AppTextField(
              readOnly: true,
              prefix: Image.asset(
                Assets.bookingicon,
                width: 24.w,
                height: 24.h,
                color: AppColors.secondary600,
              ),
              hintText: 'Monday,July 21',
              suffix: Image.asset(
                Assets.downicon,
                width: 24.w,
                height: 24.h,
                color: AppColors.secondary600,
              ),
              hintStyle: AppTextStyles.montserratButton.copyWith(
                color: AppColors.secondary600,
              ),
            ),
            SizedBox(height: 24.h),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 50,
              runSpacing: 10,
              children: List.generate(times.length, (index) {
                return ChoiceChip(
                  label: Text(
                    times[index],
                    style: AppTextStyles.montserratSmallCaption.copyWith(
                      color:
                          _selectedIndex == index
                              ? Colors.white
                              : AppColors.secondary400,
                    ),
                  ),
                  selected: _selectedIndex == index,
                  onSelected: (_) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },

                  selectedColor: AppColors.primary,
                  backgroundColor: AppColors.grey50,
                  showCheckmark: false,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              }),
            ),
            const Spacer(),
            AppButton(
              text: 'Reschedule',
              onPressed: () {
                showCancelDialog(context);
              },
            ),
            SizedBox(height: 24.h),
            AppButton(
              borderRadius: 10,
              borderColor: AppColors.grey400,
              text: 'Cancel',
              style: AppTextStyles.georgiaButton.copyWith(
                color: AppColors.grey,
              ),
              onPressed: () {},
              color: Colors.white,
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
  // @override
  // void dispose() {

  //   // TODO: implement dispose
  //   super.dispose();
  // }
}
