/// Dependency injection setup
/// Add your dependency injection configuration here
class InjectionContainer {
  /// Initialize dependencies
  static Future<void> init() async {
    // Add your dependency registration here
    // Example:
    // GetIt.instance.registerFactory(() => YourRepository());
    // GetIt.instance.registerLazySingleton(() => YourService());
  }
}
