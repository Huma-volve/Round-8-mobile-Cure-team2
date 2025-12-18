import 'package:cure_team_2/core/widgets/app_bar.dart';
import 'package:cure_team_2/features/home/presentation/pages/specialties/presentation/pages/widget/specialties_page_body.dart';
import 'package:flutter/material.dart';

class SpecialtiesPage extends StatelessWidget {
  const SpecialtiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Specialties'),
      body: SpecialtiesPageBody(),
    );
  }
}
