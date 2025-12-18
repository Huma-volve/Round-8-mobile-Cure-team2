import 'package:cure_team_2/core/widgets/app_bar.dart';
import 'package:cure_team_2/features/home/presentation/pages/doctors/presentation/pages/widget/doctors_page_body.dart';
import 'package:flutter/material.dart';

class DoctorsPage extends StatelessWidget {
  const DoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Doctors'),
      body: DoctorsPageBody(),
    );
  }
}
