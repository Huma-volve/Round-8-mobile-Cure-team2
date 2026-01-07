// import 'package:cure_team_2/core/network/api_client.dart';
// import 'package:cure_team_2/features/chat/data/datasources/chat_remote_datasource.dart';
// import 'package:cure_team_2/features/chat/data/datasources/chat_remote_datasource_impl.dart';
// import 'package:cure_team_2/features/chat/data/repositories/chat_repository_impl.dart';
// import 'package:cure_team_2/features/chat/domain/repositories/chat_repository.dart';
// import 'package:cure_team_2/features/chat/presentation/cubit/chat_detail_cubit.dart';
// import 'package:cure_team_2/features/chat/presentation/cubit/chat_list_cubit.dart';
// import 'package:get_it/get_it.dart';

// /// Dependency injection setup
// /// Add your dependency injection configuration here
// class InjectionContainer {
//   static GetIt getIt =
//       GetIt
//           .instance; // Helper to access outside if needed, though usually used directly

//   /// Initialize dependencies
//   static Future<void> init() async {
//     // Core
//     // Register ApiClient
//     if (!GetIt.instance.isRegistered<ApiClient>()) {
//       GetIt.instance.registerLazySingleton<ApiClient>(() => ApiClient());
//     }

//     // Features - Chat
//     // Data Source
//     if (!GetIt.instance.isRegistered<ChatRemoteDataSource>()) {
//       GetIt.instance.registerLazySingleton<ChatRemoteDataSource>(
//         () => ChatRemoteDataSourceImpl(GetIt.instance<ApiClient>()),
//       );
//     }

//     // Repository
//     if (!GetIt.instance.isRegistered<ChatRepository>()) {
//       GetIt.instance.registerLazySingleton<ChatRepository>(
//         () => ChatRepositoryImpl(GetIt.instance<ChatRemoteDataSource>()),
//       );
//     }

//     // Cubits
//     if (!GetIt.instance.isRegistered<ChatListCubit>()) {
//       GetIt.instance.registerFactory(
//         () => ChatListCubit(GetIt.instance<ChatRepository>()),
//       );
//     }
//     if (!GetIt.instance.isRegistered<ChatDetailCubit>()) {
//       GetIt.instance.registerFactory(
//         () => ChatDetailCubit(GetIt.instance<ChatRepository>()),
//       );
//     }
//   }
// }
import 'package:cure_team_2/core/database/shared_pref_helper.dart';
import 'package:cure_team_2/core/di/service_Locator.config.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final servicelocator = GetIt.instance;

@InjectableInit()
void serviceLocatorConfiguration() => servicelocator.init();

@module
abstract class RegisterModule {
  @singleton
  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://round8-cure-php-team-two.huma-volve.com/api/v1/',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // final sharedPref = await SharedPreferences.getInstance();
          final token = SharedPrefHelper.getString('user_token');

          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          // options.headers['Content-Type'] = 'application/json';
          // options.headers['Accept'] = 'application/json';

          handler.next(options); // لازم في جميع الحالات
        },
      ),
    );
    return dio;
  }
}
