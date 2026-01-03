import 'package:cure_team_2/core/network/api_client.dart';
import 'package:cure_team_2/features/chat/data/datasources/chat_remote_datasource.dart';
import 'package:cure_team_2/features/chat/data/datasources/chat_remote_datasource_impl.dart';
import 'package:cure_team_2/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:cure_team_2/features/chat/domain/repositories/chat_repository.dart';
import 'package:cure_team_2/features/chat/presentation/cubit/chat_detail_cubit.dart';
import 'package:cure_team_2/features/chat/presentation/cubit/chat_list_cubit.dart';
import 'package:get_it/get_it.dart';

/// Dependency injection setup
/// Add your dependency injection configuration here
class InjectionContainer {
  static GetIt getIt =
      GetIt
          .instance; // Helper to access outside if needed, though usually used directly

  /// Initialize dependencies
  static Future<void> init() async {
    // Core
    // Register ApiClient
    if (!GetIt.instance.isRegistered<ApiClient>()) {
      GetIt.instance.registerLazySingleton<ApiClient>(() => ApiClient());
    }

    // Features - Chat
    // Data Source
    if (!GetIt.instance.isRegistered<ChatRemoteDataSource>()) {
      GetIt.instance.registerLazySingleton<ChatRemoteDataSource>(
        () => ChatRemoteDataSourceImpl(GetIt.instance<ApiClient>()),
      );
    }

    // Repository
    if (!GetIt.instance.isRegistered<ChatRepository>()) {
      GetIt.instance.registerLazySingleton<ChatRepository>(
        () => ChatRepositoryImpl(GetIt.instance<ChatRemoteDataSource>()),
      );
    }

    // Cubits
    if (!GetIt.instance.isRegistered<ChatListCubit>()) {
      GetIt.instance.registerFactory(
        () => ChatListCubit(GetIt.instance<ChatRepository>()),
      );
    }
    if (!GetIt.instance.isRegistered<ChatDetailCubit>()) {
      GetIt.instance.registerFactory(
        () => ChatDetailCubit(GetIt.instance<ChatRepository>()),
      );
    }
  }
}
