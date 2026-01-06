import 'DoctorModels.dart';

class MyBookingModel {
  final int id;
  final DoctorModels doctor;
  final String date;
  final String time;
  final String status;
  final bool canReschedule;
  final bool canCancel;

  const MyBookingModel({
    required this.id,
    required this.doctor,
    required this.date,
    required this.time,
    required this.status,
    required this.canReschedule,
    required this.canCancel,
  });

  factory MyBookingModel.fromJson(Map<String, dynamic> json) => MyBookingModel(
    id: json['id'] as int,
    doctor: DoctorModels.fromJson(json['doctor'] as Map<String, dynamic>),
    date: json['date'] as String,
    time: json['time'] as String,
    status: json['status'] as String,
    canReschedule: json['can_reschedule'] as bool,
    canCancel: json['can_cancel'] as bool,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'doctor': doctor.toJson(),
    'date': date,
    'time': time,
    'status': status,
    'can_reschedule': canReschedule,
    'can_cancel': canCancel,
  };
}
