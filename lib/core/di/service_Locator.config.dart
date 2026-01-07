// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cure_team_2/core/di/service_Locator.dart' as _i942;
import 'package:cure_team_2/core/network/api_client.dart' as _i323;
import 'package:cure_team_2/features/bookingAppointment/data/data_Source/bookin_remote_data_source.dart'
    as _i709;
import 'package:cure_team_2/features/bookingAppointment/data/data_Source/booking_api_remote_data_source.dart'
    as _i399;
import 'package:cure_team_2/features/bookingAppointment/data/repositories/booking_Repository.dart'
    as _i366;
import 'package:cure_team_2/features/bookingAppointment/domain/repositoriesImp/booking_RepositoryImpl.dart'
    as _i825;
import 'package:cure_team_2/features/bookingAppointment/domain/use_case/booking_Appointment_Use_Case.dart'
    as _i804;
import 'package:cure_team_2/features/bookingAppointment/domain/use_case/cancel_booking_usecase.dart'
    as _i825;
import 'package:cure_team_2/features/bookingAppointment/domain/use_case/my_booking_useCase.dart'
    as _i465;
import 'package:cure_team_2/features/bookingAppointment/domain/use_case/reschedual_booking_useCase.dart'
    as _i741;
import 'package:cure_team_2/features/bookingAppointment/presentation/cubit/Booking_state.dart'
    as _i86;
import 'package:cure_team_2/features/bookingAppointment/presentation/cubit/bookingCubit.dart'
    as _i1052;
import 'package:cure_team_2/features/Favourite/data/datasource/Favourite_api_remote_data_source.dart'
    as _i411;
import 'package:cure_team_2/features/Favourite/data/datasource/Favourite_remote_data_source.dart'
    as _i903;
import 'package:cure_team_2/features/Favourite/data/repositories/favourite_RepositoryImpl.dart'
    as _i190;
import 'package:cure_team_2/features/Favourite/domain/repositories/favourite_Repository.dart'
    as _i683;
import 'package:cure_team_2/features/Favourite/domain/use_case/getFavourite_Use_Case.dart'
    as _i630;
import 'package:cure_team_2/features/Favourite/domain/use_case/postFavourite_Use_Case.dart'
    as _i1044;
import 'package:cure_team_2/features/Favourite/presentation/cubit/favourite_cubit.dart'
    as _i721;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i709.BookinRemoteDataSource>(
      () => _i399.BookingApiRemoteDataSource(gh<_i323.ApiClient>()),
    );
    gh.factory<_i721.FavouriteCubit>(
      () => _i721.FavouriteCubit(gh<_i190.FavouriteRepositoryimpl>()),
    );
    gh.lazySingleton<_i903.FavouriteRemoteDataSource>(
      () => _i411.FavouriteApiRemoteDataSource(gh<_i323.ApiClient>()),
    );
    gh.lazySingleton<_i366.BookingRepository>(
      () => _i825.BookingRepositoryimpl(gh<_i709.BookinRemoteDataSource>()),
    );
    gh.lazySingleton<_i683.FavouriteRepository>(
      () =>
          _i190.FavouriteRepositoryimpl(gh<_i903.FavouriteRemoteDataSource>()),
    );
    gh.factory<_i1052.Bookingcubit>(
      () => _i1052.Bookingcubit(
        gh<_i86.BookingState>(),
        gh<_i366.BookingRepository>(),
      ),
    );
    gh.lazySingleton<_i804.BookingAppointmentUseCase>(
      () => _i804.BookingAppointmentUseCase(gh<_i366.BookingRepository>()),
    );
    gh.lazySingleton<_i825.CancelBookingUsecase>(
      () => _i825.CancelBookingUsecase(gh<_i366.BookingRepository>()),
    );
    gh.lazySingleton<_i465.MyBookingUsecase>(
      () => _i465.MyBookingUsecase(gh<_i366.BookingRepository>()),
    );
    gh.lazySingleton<_i741.ReschedualBookingUsecase>(
      () => _i741.ReschedualBookingUsecase(gh<_i366.BookingRepository>()),
    );
    gh.lazySingleton<_i630.GetfavouriteUseCase>(
      () => _i630.GetfavouriteUseCase(gh<_i683.FavouriteRepository>()),
    );
    gh.lazySingleton<_i1044.PostfavouriteUseCase>(
      () => _i1044.PostfavouriteUseCase(gh<_i683.FavouriteRepository>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i942.RegisterModule {}
