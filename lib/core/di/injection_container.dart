import 'package:get_it/get_it.dart';

/// Dependency injection setup
/// Add your dependency injection configuration here
class InjectionContainer {
  GetIt getIt = GetIt.instance ;
  /// Initialize dependencies
  static Future<void> init() async {
    // Add your dependency registration here
    // Example:
    // GetIt.instance.registerFactory(() => YourRepository());
    // GetIt.instance.registerLazySingleton(() => YourService());
  }
}
