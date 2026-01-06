import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReviewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ReviewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: AppBar(
        leading: SvgPicture.asset(Assets.arrow, height: 2, width: 2),
        title: Text('Review', style: AppTextStyles.georgiaH2),
        centerTitle: true,
=======
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      leading: IconButton(
        icon: SvgPicture.asset(
          Assets.arrow,
          width: 22,
          height: 22,
          fit: BoxFit.contain,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        'Review',
        style: AppTextStyles.georgiaSubheading.copyWith(fontSize: 20),
>>>>>>> a7b006e2af1bf7d9aacb16758475b1c62104516b
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
