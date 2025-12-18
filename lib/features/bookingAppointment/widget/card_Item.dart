// import 'package:cure_team_2/core/constants/assets.dart';
// import 'package:cure_team_2/core/theme/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CardItem extends StatefulWidget {
//   const CardItem({
//     super.key,
//     required this.text,
//     required this.chekIcon,
//     required this.creditName,
//     required this.isSelected,
//     required this.ontap,
//   });

//   final String text;
//   final String chekIcon;
//   final String creditName;
//   final bool isSelected;
//   final VoidCallback ontap;

//   @override
//   State<CardItem> createState() => _CardItemState();
// }

// class _CardItemState extends State<CardItem> {
//   bool isSelected = false;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {},
//       child: Container(
//         margin: EdgeInsets.all(2.h),
//         height: 56.h,
//         width: 396.w,
//         decoration: BoxDecoration(
//           color:
//               isSelected
//                   ? AppColors
//                       .success100 // أخضر لما تضغط
//                   : Colors.transparent, // العادي
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(color: AppColors.success100),
//         ),
//         child: Row(
//           children: [
//             SizedBox(width: 10.w),
//             Image.asset(
//               isSelected ? Assets.checksolid : Assets.checkempty,
//               width: 24.w,
//               height: 24.h,
//             ),
//             SizedBox(width: 5.w),
//             Text(widget.text),
//             const Spacer(),
//             Image.asset(widget.creditName, width: 40.w, height: 40.h),
//             SizedBox(width: 10.w),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.text,
    required this.chekIcon,
    required this.creditName,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final String chekIcon;
  final String creditName;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(2.h),
        height: 56.h,
        width: 396.w,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.success100 : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.success100),
        ),
        child: Row(
          children: [
            SizedBox(width: 10.w),
            Image.asset(
              isSelected ? Assets.checksolid : Assets.checkempty,
              width: 24.w,
              height: 24.h,
            ),
            SizedBox(width: 5.w),
            Text(text),
            const Spacer(),
            Image.asset(creditName),
            SizedBox(width: 10.w),
          ],
        ),
      ),
    );
  }
}
