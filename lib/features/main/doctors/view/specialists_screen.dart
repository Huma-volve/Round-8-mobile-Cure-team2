import 'package:cure_team_2/core/cubit/base_bloc_consumer.dart';
import 'package:cure_team_2/core/extensions/padding.dart';
import 'package:cure_team_2/core/models/specialists_model.dart';
import 'package:cure_team_2/core/widgets/specialists_chip.dart';
import 'package:cure_team_2/features/main/home/logic/specialists_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialistsScreen extends StatelessWidget {
  const SpecialistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Specialists"),
      ),
      body: BaseBlocConsumer<SpecialistsCubit, List<SpecialistsModel>>(
        successBuilder: (specialists)=>Wrap(
          spacing: 16.w,
          runSpacing: 16.h,
          children: List.generate(specialists.length, (index)=> SpecialistsChip.vertical(
            model: specialists[index],
          )),
        ).appPaddingAll(),
      ),
    );
  }
}
