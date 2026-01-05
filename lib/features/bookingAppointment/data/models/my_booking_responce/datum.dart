import 'doctor.dart';

class Datum {
  final int? id;
  final Doctor? doctor;
  final String? date;
  final String? time;
  final String? status;
  final bool? canReschedule;
  final bool? canCancel;

  const Datum({
    this.id,
    this.doctor,
    this.date,
    this.time,
    this.status,
    this.canReschedule,
    this.canCancel,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json['id'] as int?,
    doctor:
        json['doctor'] == null
            ? null
            : Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
    date: json['date'] as String?,
    time: json['time'] as String?,
    status: json['status'] as String?,
    canReschedule: json['can_reschedule'] as bool?,
    canCancel: json['can_cancel'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'doctor': doctor?.toJson(),
    'date': date,
    'time': time,
    'status': status,
    'can_reschedule': canReschedule,
    'can_cancel': canCancel,
  };
}
