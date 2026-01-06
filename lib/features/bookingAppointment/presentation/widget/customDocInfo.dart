import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDoctorInfo extends StatefulWidget {
  const CustomDoctorInfo({super.key});

  @override
  State<CustomDoctorInfo> createState() => _CustomDoctorInfoState();
}

class _CustomDoctorInfoState extends State<CustomDoctorInfo> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 113.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Stack(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage(Assets.doctorphoto),
              ),
              Positioned(
                right: 0,
                bottom: 5,
                child: Image(
                  image: AssetImage(Assets.checkdoctor),
                  width: 18,
                  height: 18,
                ),
              ),
            ],
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dr. Jessica Turner', style: AppTextStyles.georgiaH3),
                const SizedBox(height: 4),
                Text('Pulmonologist', style: AppTextStyles.montserratCaption),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Image(
                      image: AssetImage(Assets.location),
                      width: 14,
                      height: 14,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        '129, El-Nasr Street, Cairo',
                        style: AppTextStyles.georgiaCaption,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.grey50,
            child: CircleAvatar(
              radius: 23.5,
              backgroundColor: Colors.white,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isSelected = !_isSelected;
                  });
                },
                child: Image(
                  color: _isSelected ? AppColors.error : AppColors.grey,
                  image: const AssetImage(Assets.fav),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
