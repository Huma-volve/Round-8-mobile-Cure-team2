import 'package:cure_team_2/core/database/shared_pref_helper.dart';
import 'package:cure_team_2/core/di/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app.dart';
import 'core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    InjectionContainer.init(),
    SharedPrefHelper.init(),
    ScreenUtil.ensureScreenSize(),
  ]);
  runApp(MyApp(
    router: AppRouter(),
  ));
}
