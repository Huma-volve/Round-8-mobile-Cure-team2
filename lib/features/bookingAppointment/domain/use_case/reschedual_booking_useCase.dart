import 'package:cure_team_2/core/error/failures.dart';
import 'package:cure_team_2/features/bookingAppointment/data/repositories/booking_Repository.dart';
import 'package:cure_team_2/features/bookingAppointment/domain/entities/reschedual_booking_entities.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@LazySingleton()
class ReschedualBookingUsecase {
  final BookingRepository _bookingRepository;

  ReschedualBookingUsecase(this._bookingRepository);
  Future<Either<Failure, List<ReschedualBookingEntities>>> call({
    int? appointmentDate,
    int? appointmentTime,
  }) => _bookingRepository.reschedualbooking(
    appointmentDate: appointmentDate,
    appointmentTime: appointmentTime,
  );
}
