import 'package:cure_team_2/core/error/failures.dart';
import 'package:cure_team_2/features/bookingAppointment/data/repositories/booking_Repository.dart';
import 'package:cure_team_2/features/bookingAppointment/domain/entities/bookinAppointment_entities.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@LazySingleton()
class BookingAppointmentUseCase {
  final BookingRepository _bookingRepository;

  BookingAppointmentUseCase(this._bookingRepository);
  Future<Either<Failure, List<BookinappointmentEntities>>> call({
    int? doctorId,
    int? date,
    int? time,
  }) => _bookingRepository.bookingsAppointment(
    doctorId: doctorId,
    date: date,
    time: time,
  );
}
