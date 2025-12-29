import 'package:cure_team_2/core/network/api_service.dart';
import 'package:cure_team_2/features/main/home/data/repository/home_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../network/dio_factory.dart';

/// Dependency injection setup
/// Add your dependency injection configuration here
class InjectionContainer {
  static GetIt getIt = GetIt.instance;

  /// Initialize dependencies
  static Future<void> init() async {
    final Dio dio = await DioFactory.getDio();
   getIt.registerLazySingleton<ApiService>(()=>ApiService(dio)) ;

   getIt.registerFactory<HomeRepository>(()=>HomeRepository(getIt.get<ApiService>())) ;
    // Add your dependency registration here
    // Example:
    // GetIt.instance.registerFactory(() => YourRepository());
    // GetIt.instance.registerLazySingleton(() => YourService());
  }
}
