class Data {
  final int? id;
  final String? doctorId;
  final int? userId;
  final String? appointmentDate;
  final String? appointmentTime;
  final int? price;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? doctor;
  final String? patient;

  const Data({
    this.id,
    this.doctorId,
    this.userId,
    this.appointmentDate,
    this.appointmentTime,
    this.price,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.doctor,
    this.patient,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json['id'] as int?,
    doctorId: json['doctor_id'] as String?,
    userId: json['user_id'] as int?,
    appointmentDate: json['appointment_date'] as String?,
    appointmentTime: json['appointment_time'] as String?,
    price: json['price'] as int?,
    status: json['status'] as String?,
    createdAt:
        json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
    updatedAt:
        json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
    doctor: json['doctor'] as String?,
    patient: json['patient'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'doctor_id': doctorId,
    'user_id': userId,
    'appointment_date': appointmentDate,
    'appointment_time': appointmentTime,
    'price': price,
    'status': status,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
    'doctor': doctor,
    'patient': patient,
  };
}
