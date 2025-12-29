import 'package:cure_team_2/core/extensions/padding.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:cure_team_2/core/widgets/app_cached_network_image.dart';
import 'package:cure_team_2/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      height: 88.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.grey300)
      ),
      child: Row(
        children: [
          Container(
            width: 89.w,
            height: 88.h,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                bottomLeft: Radius.circular(15.r),
              ),
            ),
            child: const AppCachedNetworkImage(
              fit: BoxFit.cover,
                "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg"),
          ),
          const HSpace(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Robert Johnson", style: AppTextStyles.georgiaButton,),
              Text("Orthopedic | El-Nasr Hospital", style: AppTextStyles.montserratCaption.copyWith(
                color: AppColors.grey300
              ),),
              Row(
                children: [
                  rating(),
                  const HSpace(16) ,
                  availability()
                ],
              )

            ],
          ),
          const Spacer(),
          const Icon(Icons.favorite_outline).appPaddingAll(),
        ],
      ),
    );
  }
  Widget rating()=>Row(
    children: [
      Icon(Icons.star , color: AppColors.warning300,size: 16.sp,),
      Text("4.3",style: AppTextStyles.montserratCaption,)
    ],
  );
  Widget availability()=> Row(children: [
    Icon(Icons.timer_outlined, size: 16.sp, color: AppColors.grey700,), 
    const HSpace(4),
    Text("9:30am - 8:00pm", style: AppTextStyles.montserratCaption,)
  ],);
}
