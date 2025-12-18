import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/core/widgets/app_text_field.dart';
import 'package:cure_team_2/features/bookingAppointment/widget/TotalPriceAndNavb.dart';
import 'package:cure_team_2/features/bookingAppointment/widget/customAppBar.dart';
import 'package:cure_team_2/features/bookingAppointment/widget/customDocInfo.dart';
import 'package:cure_team_2/features/bookingAppointment/widget/customTabCalender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class Bookingappointment extends StatefulWidget {
  const Bookingappointment({super.key});

  @override
  State<Bookingappointment> createState() => _BookingappointmentState();
}

class _BookingappointmentState extends State<Bookingappointment> {
  final TextEditingController tController = TextEditingController();

  DateTime? selectedday = DateTime.now();
  DateTime focusedday = DateTime.now();

  @override
  void initState() {
    super.initState();
    tController.text = DateFormat('EEEE MMMM d').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(title: Text('Book Appointment')),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(right: 28.w, left: 28.w, bottom: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomDoctorInfo(),
              SizedBox(height: 16.h),

              Text('Select a day', style: AppTextStyles.georgiaSubheading),
              SizedBox(height: 16.h),

              /// Date TextField
              AppTextField(
                borderColor: AppColors.primary,
                controller: tController,
                readOnly: true,
                hintText: 'Select day',
                prefix: const ImageIcon(AssetImage(Assets.bookingicon)),
                suffix: const ImageIcon(AssetImage(Assets.upicon)),
              ),
              SizedBox(height: 16.h),

              /// Calendar (Separated Widget)
              Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(width: 1.5.w, color: AppColors.grey50),
                ),
                child: CustomTableCalendar(
                  selectedDay: selectedday,
                  focusedDay: focusedday,
                  onDaySelected: (selected, focused) {
                    setState(() {
                      selectedday = selected;
                      focusedday = focused;
                    });

                    tController.text = DateFormat(
                      'EEEE MMMM d',
                    ).format(selected);
                  },
                ),
              ),

              const SizedBox(height: 12),

              Text('select time', style: AppTextStyles.georgiaSubheading),
            ],
          ),
        ),
      ),

      /// Bottom Bar
      bottomNavigationBar: Totalpriceandnavb(
        text: 'Continue to Pay',
        onPressed: () {},
      ),
    );
  }
}
