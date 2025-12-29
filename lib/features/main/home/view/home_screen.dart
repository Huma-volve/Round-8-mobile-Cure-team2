import 'package:cure_team_2/core/extensions/navigation.dart';
import 'package:cure_team_2/core/extensions/padding.dart';
import 'package:cure_team_2/core/routing/routes.dart';
import 'package:cure_team_2/features/main/home/logic/specialists_cubit.dart';
import 'package:cure_team_2/features/main/home/view/widgets/doctors_near_you.dart';
import 'package:cure_team_2/features/main/home/view/widgets/home_appbar.dart';
import 'package:cure_team_2/features/main/home/view/widgets/home_banner.dart';
import 'package:cure_team_2/features/main/home/view/widgets/specialties_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final SpecialistsCubit cubit = context.read<SpecialistsCubit>();
    return  SafeArea(
        child:  SingleChildScrollView(
          child: Column(
            children: [
              const HomeAppbar(),
               MainSearchBar(
                onTap: (){
                  context.pushNamed(Routes.search, arguments: cubit);
                },
              ).appPaddingVr(24) ,
              const SpecialtiesSection(),
              const HomeBanner().appPaddingVr(24),
              const DoctorsNearYou()
          ],).appPaddingHr(),
        ),
      );
  }

}



