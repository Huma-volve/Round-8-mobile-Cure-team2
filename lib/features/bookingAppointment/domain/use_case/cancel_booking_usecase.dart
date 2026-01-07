import 'package:cure_team_2/core/error/failures.dart';
import 'package:cure_team_2/features/bookingAppointment/data/repositories/booking_Repository.dart';
import 'package:cure_team_2/features/bookingAppointment/domain/entities/cancel_booking_entities.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@LazySingleton()
class CancelBookingUsecase {
  final BookingRepository _bookingRepository;

  CancelBookingUsecase(this._bookingRepository);
  Future<Either<Failure, List<CancelBookingEntities>>> call() =>
      _bookingRepository.cancelbooking();
}
