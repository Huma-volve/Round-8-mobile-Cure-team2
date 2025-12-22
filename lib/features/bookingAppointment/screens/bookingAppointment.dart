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
  final TextEditingController _dateController = TextEditingController();
  final DateFormat _dateFormat = DateFormat('EEEE MMMM d');
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    _dateController.text = _dateFormat.format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(title: 'Book Appointment'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(right: 28.w, left: 28.w, bottom: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomDoctorInfo(),
              SizedBox(height: 16.h),
              Text('Select a day', style: AppTextStyles.georgiaSubheading),
              SizedBox(height: 16.h),
              AppTextField(
                borderWidth: 1,
                borderColor: AppColors.primary,
                controller: _dateController,
                readOnly: true,
                hintText: 'Select day',
                prefix: const ImageIcon(AssetImage(Assets.bookingicon)),
                suffix: const ImageIcon(AssetImage(Assets.upicon)),
              ),
              SizedBox(height: 16.h),
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
                  selectedDay: _selectedDay,
                  focusedDay: _focusedDay,
                  onDaySelected: (selected, focused) {
                    setState(() {
                      _selectedDay = selected;
                      _focusedDay = focused;
                    });
                    _dateController.text = _dateFormat.format(selected);
                  },
                ),
              ),
              const SizedBox(height: 12),
              Text('select time', style: AppTextStyles.georgiaSubheading),
            ],
          ),
        ),
      ),
      bottomNavigationBar: TotalPriceAndNavBar(
        text: 'Continue to Pay',
        onPressed: () {},
      ),
    );
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }
}
