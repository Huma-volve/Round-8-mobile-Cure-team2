import 'package:cure_team_2/core/cubit/base_bloc_consumer.dart';
import 'package:cure_team_2/core/extensions/navigation.dart';
import 'package:cure_team_2/core/extensions/padding.dart';
import 'package:cure_team_2/core/models/specialists_model.dart';
import 'package:cure_team_2/core/routing/routes.dart';
import 'package:cure_team_2/core/widgets/specialists_chip.dart';
import 'package:cure_team_2/features/main/home/logic/specialists_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/section_header.dart';
import '../../../../../core/widgets/spacing.dart';

class SpecialtiesSection extends StatelessWidget {
  const SpecialtiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final SpecialistsCubit cubit = context.read<SpecialistsCubit>();

    return BaseBlocConsumer<SpecialistsCubit , List<SpecialistsModel>>(
      successBuilder: (specialists)=> Column(
        children: [
          SectionHeader(
            title: "Specialist",
            onActionTap: () {
              context.pushNamed(Routes.specialists, arguments: cubit);
            },
          ),
          const VSpace(16),
          SizedBox(
              height: 40.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  itemBuilder: (_, index) =>  SpecialistsChip(model: specialists[index],).appPaddingHr(4)))
        ],
      ),
      /// you can handle here
      /// failure and loading or empty states
    );
  }
}
