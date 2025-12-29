import 'package:cure_team_2/core/extensions/navigation.dart';
import 'package:cure_team_2/core/routing/routes.dart';
import 'package:cure_team_2/core/widgets/doctor_card.dart';
import 'package:cure_team_2/core/widgets/section_header.dart';
import 'package:cure_team_2/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/specialists_cubit.dart';

class DoctorsNearYou extends StatelessWidget {
  const DoctorsNearYou({super.key});

  @override
  Widget build(BuildContext context) {
    final SpecialistsCubit cubit = context.read<SpecialistsCubit>();

    return Column(
      children: [
         SectionHeader(title: "Doctors near you",onActionTap: ()=>context.pushNamed(Routes.doctors, arguments: cubit), ),
        const VSpace(24),
        ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_,__)=>const DoctorCard()),


      ],
    );
  }
}
