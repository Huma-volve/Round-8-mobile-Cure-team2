import 'package:cure_team_2/core/cubit/base_bloc_consumer.dart';
import 'package:cure_team_2/core/extensions/padding.dart';
import 'package:cure_team_2/core/models/specialists_model.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/core/widgets/section_header.dart';
import 'package:cure_team_2/core/widgets/spacing.dart';
import 'package:cure_team_2/core/widgets/specialists_chip.dart';
import 'package:cure_team_2/features/main/home/logic/specialists_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/widgets/search_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("search"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           const MainSearchBar(
             autoFocus: true,
           ).appPaddingVr(16) ,
            ///search BY Location
            Row(
              children: [
                Text("Search by your location" , style: AppTextStyles.montserratRegularButton,),
                const HSpace(4) ,
                Text("129,El-Nasr Street, Cairo", style: AppTextStyles.montserratSmallCaption.copyWith(
                  color: AppColors.info
                ),)
              
            ],), 
            /// allSpecialists
            const VSpace(24) ,
            BaseBlocConsumer<SpecialistsCubit, List<SpecialistsModel>>(
                successBuilder: (specialists)=> _allSpecialists(specialists),
            ),
            const VSpace(24),
            /// history
               _historySearch()
          ],
        ).appPaddingHr(),
      ),
    );
  }
  
  Widget _allSpecialists(List<SpecialistsModel> specialists)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SectionHeader(title: "All Specialties", showAction: false,),
      const VSpace(16),
      Wrap(
        spacing: 8.w,
        runSpacing: 16.h,
        direction: Axis.horizontal,
        children: List.generate(specialists.length,(index)=>  SpecialistsChip(model: specialists[index],) ),
      )
    ],
  );
  Widget _historySearch()=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SectionHeader(title: "History", showAction: false,),
      const VSpace(16),
      Wrap(
        spacing: 4.w,
        runSpacing: 8.h,
        direction: Axis.horizontal,
        children: List.generate(4,(_)=> Container(
          height: 40.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.grey300),
          ),
          child: Text(
            "heart",
            style: AppTextStyles.montserratButton
                .copyWith(color: AppColors.grey300),
          ),
        )
        ),
      )
    ],
  );
}
