import 'package:cure_team_2/core/database/shared_pref_helper.dart';
import 'package:cure_team_2/core/di/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart'; // هضيف ده
import 'app.dart';
import 'core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    InjectionContainer.init(),
    SharedPrefHelper.init(),
    ScreenUtil.ensureScreenSize(),
  ]);

  runApp(
    DevicePreview(
      enabled: true, // ممكن تحط false لو عايز تطفيه
      builder: (context) => MyApp(router: AppRouter()),
    ),
  );
}
