import 'package:cure_team_2/features/Doctor_Details/widgets/doctor_about_section.dart';
import 'package:cure_team_2/features/Doctor_Details/widgets/doctor_header_section.dart';
import 'package:cure_team_2/features/Doctor_Details/widgets/doctor_info_row_section.dart';
import 'package:cure_team_2/features/Doctor_Details/widgets/doctor_rating_section.dart';
import 'package:cure_team_2/features/Doctor_Details/widgets/doctor_reviw_section.dart';
import 'package:cure_team_2/features/Doctor_Details/widgets/doctor_state_section.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/core/widgets/app_button.dart';
import 'package:flutter/material.dart';

const _sectionPadding = EdgeInsets.symmetric(horizontal: 17);

class DoctorDetailsViewBody extends StatelessWidget {
  const DoctorDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;
    const bottomBarHeight = 132.0;

    return Stack(
      children: [
        Positioned.fill(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: bottomBarHeight + bottomInset),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                const Padding(
                  padding: _sectionPadding,
                  child: DoctorHeaderSection(),
                ),
                const SizedBox(height: 22),
                const Padding(
                  padding: _sectionPadding,
                  child: DoctorStatsSection(),
                ),
                const SizedBox(height: 35),
                const Padding(
                  padding: _sectionPadding,
                  child: DoctorAboutSection(),
                ),
                const SizedBox(height: 35),
                const Padding(
                  padding: _sectionPadding,
                  child: DoctorInfoRowSection(),
                ),
                const SizedBox(height: 15),
                const Padding(
                  padding: _sectionPadding,
                  child: DoctorRatingSection(),
                ),
                const SizedBox(height: 45),
                const Padding(
                  padding: _sectionPadding,
                  child: DoctorReviewsSection(),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: SafeArea(
            top: false,
            child: Container(
              padding: const EdgeInsets.fromLTRB(17, 12, 17, 16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 16,
                    offset: const Offset(0, -6),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        'Price',
                        style: AppTextStyles.georgiaSubheading.copyWith(
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '/ hour',
                        style: AppTextStyles.montserratRegularSmallCaption
                            .copyWith(color: AppColors.grey700),
                      ),
                      const Spacer(),
                      Text(
                        '350\$',
                        style: AppTextStyles.montserratSubheading.copyWith(
                          fontSize: 16,
                          color: AppColors.error,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  AppButton(
                    text: 'Book Appointment',
                    borderRadius: 12,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
