import 'package:cure_team_2/features/bookingAppointment/domain/entities/bookinAppointment_entities.dart';
import 'package:cure_team_2/features/bookingAppointment/domain/entities/cancel_booking_entities.dart';
import 'package:cure_team_2/features/bookingAppointment/domain/entities/my_booking_entites.dart';
import 'package:cure_team_2/features/bookingAppointment/domain/entities/reschedual_booking_entities.dart';

abstract class BookingState {}

class InitialBookingState extends BookingState {}

class LoadingBookingState extends BookingState {}

class ErrorBookingState extends BookingState {
  final String message;

  ErrorBookingState(this.message);
}

class SuccessBookingAppointmentState extends BookingState {
  final List<BookinappointmentEntities> bookingAppointment;

  SuccessBookingAppointmentState(this.bookingAppointment);
}

class SuccessMyBookingState extends BookingState {
  final List<MyBookingEntites> mybooking;

  SuccessMyBookingState(this.mybooking);
}

class SuccessCancelBookingState extends BookingState {
  final List<CancelBookingEntities> cancel;

  SuccessCancelBookingState(this.cancel);
}

class SuccessReschedualBookingState extends BookingState {
  final List<ReschedualBookingEntities> reschedual;

  SuccessReschedualBookingState(this.reschedual);
}
