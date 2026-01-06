import 'package:cure_team_2/features/bookingAppointment/data/models/booking_appointments_responce/booking_appointments_responce.dart';
import 'package:cure_team_2/features/bookingAppointment/data/models/cancel_Mybookin/cancel_my_booking.dart';
import 'package:cure_team_2/features/bookingAppointment/data/models/my_booking_responce/my_booking_responce.dart';
import 'package:cure_team_2/features/bookingAppointment/data/models/reschedual_mybooking/reschedual_mybooking.dart';

abstract class BookinRemoteDataSource {
  Future<BookingAppointmentsResponce> bookingappointment({
    int? doctorId,
    int? date,
    int? time,
  });
  Future<MyBookingResponce> mybooking();
  Future<CancelMyBookingResponce> cancelBooking();
  Future<ReschedualMybookingResponce> reschedualBooking({
    int? appointmentDate,
    int? appointmentTime,
  });
}
