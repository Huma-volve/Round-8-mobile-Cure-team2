import 'package:cure_team_2/features/bookingAppointment/data/models/cancel_Mybookin/cancel_my_booking.dart';
import 'package:cure_team_2/features/bookingAppointment/domain/entities/cancel_booking_entities.dart';

extension CancelBookingMappers on CancelMyBookingResponce {
  CancelBookingEntities toEntity() =>
     CancelBookingEntities();
}
