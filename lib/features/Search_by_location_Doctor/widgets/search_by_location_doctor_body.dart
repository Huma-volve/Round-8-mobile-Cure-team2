import 'package:cure_team_2/features/Search_by_location_Doctor/widgets/doctor_cart_section.dart';
import 'package:cure_team_2/features/Search_by_location_Doctor/widgets/option_row_section.dart';
import 'package:cure_team_2/features/Search_by_location_Doctor/widgets/seach_text_field_section.dart';
import 'package:cure_team_2/features/Search_by_location_Doctor/widgets/title_text_section.dart';
import 'package:flutter/material.dart';

class SearchByLocationDoctorBody extends StatelessWidget {
  const SearchByLocationDoctorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTextFieldSection(),
          SizedBox(height: 16),
          OptionsRowSection(),
          SizedBox(height: 16),
          TitleTextSection(),
          SizedBox(height: 16),
          DoctorCardSection(),
        ],
      ),
    );
  }
}
