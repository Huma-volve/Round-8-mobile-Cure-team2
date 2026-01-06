import 'package:cure_team_2/features/bookingAppointment/data/models/my_booking_responce/DoctorModels.dart';

class MyBookingEntites {
  final int id;
  final DoctorModels doctor;
  final String date;
  final String time;
  final String status;
  final bool canReschedule;
  final bool canCancel;

  const MyBookingEntites({
    required this.id,
    required this.doctor,
    required this.date,
    required this.time,
    required this.status,
    required this.canReschedule,
    required this.canCancel,
  });
}
