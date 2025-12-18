import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDoctorInfo extends StatelessWidget {
  const CustomDoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 113.h,
      width: 428.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Stack(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage(Assets.doctorphoto,),
              ),
              Positioned(
                right: 0,
                bottom: 5,
                child: Image(image: AssetImage(Assets.checkdoctor)),
              ),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dr. Jessica Turner', style: AppTextStyles.georgiaH3),
              Text('Pulmonologist', style: AppTextStyles.montserratCaption),
              Row(
                children: [
                  const Image(image: AssetImage(Assets.location)),
                  Text(
                    '129,El-Nasr Street, Cairo ',
                    style: AppTextStyles.georgiaCaption,
                  ),
                ],
              ),
            ],
          ),
       const   CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.grey,
            child:  CircleAvatar(
              radius: 23.5,
              backgroundColor: Colors.white,
              child:  Image(image: AssetImage(Assets.fav)),
            ),
          ),
        ],
      ),
    );
  }
}
