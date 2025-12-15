import 'package:cure_team_2/core/extensions/navigation.dart';
import 'package:cure_team_2/core/extensions/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/assets.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {});
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.pushNamedAndRemoveUntil(Routes.onBoarding , predicate: (_)=>false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Column(
            children: [
              const Spacer(),
              SvgPicture.asset(
                Assets.logoWhite,
                width: 60.w,
                height: 60.h,
              ),
              const Spacer(),
              SpinKitThreeBounce(
                color: Colors.white,
                size: 36.w,
              ),
            ],
          ).appPaddingVr(48),
        ));
  }
}
