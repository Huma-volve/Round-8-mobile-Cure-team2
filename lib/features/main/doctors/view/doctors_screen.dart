import 'package:cure_team_2/core/cubit/base_bloc_consumer.dart';
import 'package:cure_team_2/core/cubit/base_state.dart';
import 'package:cure_team_2/core/extensions/padding.dart';
import 'package:cure_team_2/core/models/specialists_model.dart';
import 'package:cure_team_2/core/widgets/doctor_card.dart';
import 'package:cure_team_2/features/main/doctors/view/widgets/specialists_tabbar.dart';
import 'package:cure_team_2/features/main/home/logic/specialists_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/spacing.dart';
import '../../common/widgets/search_bar.dart';


class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Doctor")),
      body: Column(
        children: [
          const MainSearchBar().appPaddingAll(),

          BaseBlocConsumer<SpecialistsCubit, List<SpecialistsModel>>(
            onSuccess: (items) {},
            successBuilder: (items) {
              if (items.isEmpty) return const SizedBox.shrink();
              return Expanded(
                child: DefaultTabController(
                  length: items.length,
                  child: Column(
                    children: [
                      SpecialistsTabBar(tabs: items),
                      const VSpace(16),
                      Expanded(
                        child: TabBarView(
                          children: List.generate(
                            items.length,
                                (_) => ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              itemBuilder: (_, __) => const DoctorCard(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
