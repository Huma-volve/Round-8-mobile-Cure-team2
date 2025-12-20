import 'package:cure_team_2/core/routing/app_router.dart';
import 'package:cure_team_2/core/theme/app_theme.dart';
import 'package:cure_team_2/features/Favourite/Screens/Your_Favourite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  final AppRouter router;
  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      child: SafeArea(
        top: false,
        right: false,
        left: false,
        child: MaterialApp(
          title: 'cure_team_1',
          home: YourFavourite(),
          // initialRoute:Routes.navbar,
          onGenerateRoute: router.generateRoute,
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
