import 'package:cure_team_2/core/error/failures.dart';
import 'package:cure_team_2/features/bookingAppointment/domain/entities/bookinAppointment_entities.dart';
import 'package:cure_team_2/features/bookingAppointment/domain/entities/cancel_booking_entities.dart';
import 'package:cure_team_2/features/bookingAppointment/domain/entities/my_booking_entites.dart';
import 'package:cure_team_2/features/bookingAppointment/domain/entities/reschedual_booking_entities.dart';
import 'package:dartz/dartz.dart';

abstract class BookingRepository {
  Future<Either<Failure, List<BookinappointmentEntities>>> bookingsAppointment({
    int? doctorId,
    int? date,
    int? time,
  });
  Future<Either<Failure, List<MyBookingEntites>>> mybookings();
  Future<Either<Failure, List<CancelBookingEntities>>> cancelbooking();
  Future<Either<Failure, List<ReschedualBookingEntities>>> reschedualbooking({
    int? appointmentDate,
    int? appointmentTime,
  });
}
