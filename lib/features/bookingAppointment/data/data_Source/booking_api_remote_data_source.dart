import 'package:cure_team_2/core/network/api_client.dart';
import 'package:cure_team_2/features/bookingAppointment/data/data_Source/bookin_remote_data_source.dart';
import 'package:cure_team_2/features/bookingAppointment/data/models/booking_appointments_responce/booking_appointments_responce.dart';
import 'package:cure_team_2/features/bookingAppointment/data/models/cancel_Mybookin/cancel_my_booking.dart';
import 'package:cure_team_2/features/bookingAppointment/data/models/my_booking_responce/my_booking_responce.dart';
import 'package:cure_team_2/features/bookingAppointment/data/models/reschedual_mybooking/reschedual_mybooking.dart';

class BookingApiRemoteDataSource implements BookinRemoteDataSource {
  final ApiClient _apiClient;

  BookingApiRemoteDataSource(this._apiClient);
  @override
  Future<BookingAppointmentsResponce> bookingappointment({
    int? doctorId,
    int? date,
    int? time,
  }) async {
    final responce = await _apiClient.post("appointments/book");
    return BookingAppointmentsResponce.fromJson(responce.data);
  }

  @override
  Future<CancelMyBookingResponce> cancelBooking() async {
    final responce = await _apiClient.post("appointments/4/cancel");
    return CancelMyBookingResponce.fromJson(responce.data);
  }

  @override
  Future<MyBookingResponce> mybooking() async {
    final responce = await _apiClient.get("appointments/my-bookings");
    return MyBookingResponce.fromJson(responce.data);
  }

  @override
  Future<ReschedualMybookingResponce> reschedualBooking({
    int? appointmentDate,
    int? appointmentTime,
  }) async {
    final responce = await _apiClient.post("appointments/4/reschedule");
    return ReschedualMybookingResponce.fromJson(responce.data);
  }
}
