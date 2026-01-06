import 'package:cure_team_2/features/bookingAppointment/data/models/my_booking_responce/MyBookingModel.dart';
import 'package:cure_team_2/features/bookingAppointment/domain/entities/my_booking_entites.dart';

extension MybookingMappers on MyBookingModel {
  MyBookingEntites toEntity() => MyBookingEntites(
    id: id,
    doctor: doctor,
    date: date,
    time: time,
    status: status,
    canReschedule: canReschedule,
    canCancel: canCancel,
  );
}
