import 'package:cure_team_2/core/error/failures.dart';
import 'package:cure_team_2/features/bookingAppointment/data/repositories/booking_Repository.dart';
import 'package:cure_team_2/features/bookingAppointment/domain/entities/my_booking_entites.dart';
import 'package:dartz/dartz.dart';

class MyBookingUsecase {
  final BookingRepository _bookingRepository;

  MyBookingUsecase(this._bookingRepository);
  Future<Either<Failure, List<MyBookingEntites>>> call() =>
      _bookingRepository.mybookings();
}
