import 'package:cure_team_2/features/bookingAppointment/data/models/reschedual_mybooking/ReschedualMybookingModel.dart';
import 'package:cure_team_2/features/bookingAppointment/domain/entities/reschedual_booking_entities.dart';

extension ReschedualBookingMappers on ReschedualMybookingModel {
  ReschedualBookingEntities toEntity() =>
    ReschedualBookingEntities();
}
