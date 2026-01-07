import 'package:cure_team_2/core/error/exceptions.dart';
import 'package:cure_team_2/core/error/failures.dart';
import 'package:cure_team_2/features/bookingAppointment/data/data_Source/bookin_remote_data_source.dart';
import 'package:cure_team_2/features/bookingAppointment/data/mappers/bookingappointment_mappers.dart';
import 'package:cure_team_2/features/bookingAppointment/data/mappers/cancel_booking_mappers.dart';
import 'package:cure_team_2/features/bookingAppointment/data/mappers/mybooking_mappers.dart';
import 'package:cure_team_2/features/bookingAppointment/data/mappers/reschedual_booking_mappers.dart';
import 'package:cure_team_2/features/bookingAppointment/data/repositories/booking_Repository.dart';
import 'package:cure_team_2/features/bookingAppointment/domain/entities/bookinAppointment_entities.dart';
import 'package:cure_team_2/features/bookingAppointment/domain/entities/cancel_booking_entities.dart';
import 'package:cure_team_2/features/bookingAppointment/domain/entities/my_booking_entites.dart';
import 'package:cure_team_2/features/bookingAppointment/domain/entities/reschedual_booking_entities.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as:BookingRepository )
class BookingRepositoryimpl implements BookingRepository {
  final BookinRemoteDataSource _bookinRemoteDataSource;

  BookingRepositoryimpl(this._bookinRemoteDataSource);
  @override
  Future<Either<Failure, List<BookinappointmentEntities>>> bookingsAppointment({
    int? doctorId,
    int? date,
    int? time,
  }) async {
    try {
      final result = await _bookinRemoteDataSource.bookingappointment(
        doctorId: doctorId,
      );
      final resultentity = result.data!.toEntity();
      return Right(resultentity as List<BookinappointmentEntities>);
    } on RemoteException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<CancelBookingEntities>>> cancelbooking() async {
    try {
      final result = await _bookinRemoteDataSource.cancelBooking();
      final resultentity = result.toEntity();
      return Right(resultentity as List<CancelBookingEntities>);
    } on RemoteException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<MyBookingEntites>>> mybookings() async {
    try {
      final result = await _bookinRemoteDataSource.mybooking();
      final entitiyresult = result.data!.map((e) => e.toEntity()).toList();
      return Right(entitiyresult);
    } on RemoteException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<ReschedualBookingEntities>>> reschedualbooking({
    int? appointmentDate,
    int? appointmentTime,
  }) async {
    try {
      final result = await _bookinRemoteDataSource.reschedualBooking();
      final resultentity = result.data.toEntity();
      return Right(resultentity as List<ReschedualBookingEntities>);
    } on RemoteException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
