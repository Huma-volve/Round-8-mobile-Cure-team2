import 'package:cure_team_2/features/bookingAppointment/data/models/booking_appointments_responce/BookingAppointmentsModel.dart';
import 'package:cure_team_2/features/bookingAppointment/domain/entities/bookinAppointment_entities.dart';

extension BookingappointmentMappers on BookingAppointmentsModel {
  BookinappointmentEntities toEntity() => BookinappointmentEntities(
    id: id,
    doctorId: doctorId,
    userId: userId,
    appointmentDate: appointmentDate,
    appointmentTime: appointmentTime,
    price: price,
    status: status,
    createdAt: createdAt,
    updatedAt: updatedAt,
    doctor: doctor,
    patient: patient,
  );
}
