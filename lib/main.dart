import 'package:cure_team_2/core/database/shared_pref_helper.dart';
import 'package:cure_team_2/core/di/service_Locator.dart';
import 'package:cure_team_2/core/state_management/App_Bloc_Observer.dart';
import 'package:device_preview/device_preview.dart'; // هضيف ده
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  serviceLocatorConfiguration();
  SharedPrefHelper.init();

  runApp(
    DevicePreview(
      enabled: true, // ممكن تحط false لو عايز تطفيه
      builder: (context) => MyApp(router: AppRouter()),
    ),
  );
}
