class BookinappointmentEntities {
  final int id;
  final String doctorId;
  final int userId;
  final String appointmentDate;
  final String appointmentTime;
  final int price;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String doctor;
  final String patient;

  const BookinappointmentEntities({
    required this.id,
    required this.doctorId,
    required this.userId,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.price,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.doctor,
    required this.patient,
  });
}
