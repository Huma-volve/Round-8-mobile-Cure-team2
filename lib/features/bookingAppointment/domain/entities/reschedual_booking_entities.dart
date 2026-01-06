import 'package:cure_team_2/features/bookingAppointment/data/models/reschedual_mybooking/ReschedualMybookingModel.dart';

class ReschedualBookingEntities {
  final bool? status;
  final String? message;
  final ReschedualMybookingModel? data;

  const ReschedualBookingEntities({this.status, this.message, this.data});
}
