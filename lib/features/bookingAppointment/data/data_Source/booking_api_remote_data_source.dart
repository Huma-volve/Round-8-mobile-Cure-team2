import 'package:cure_team_2/core/error/exceptions.dart';
import 'package:cure_team_2/core/network/api_client.dart';
import 'package:cure_team_2/features/bookingAppointment/data/data_Source/bookin_remote_data_source.dart';
import 'package:cure_team_2/features/bookingAppointment/data/models/booking_appointments_responce/booking_appointments_responce.dart';
import 'package:cure_team_2/features/bookingAppointment/data/models/cancel_Mybookin/cancel_my_booking.dart';
import 'package:cure_team_2/features/bookingAppointment/data/models/my_booking_responce/my_booking_responce.dart';
import 'package:cure_team_2/features/bookingAppointment/data/models/reschedual_mybooking/reschedual_mybooking.dart';
import 'package:dio/dio.dart';

class BookingApiRemoteDataSource implements BookinRemoteDataSource {
  @override
  Future<BookingAppointmentsResponce> bookingappointment({

    int? doctorId,
    int? date,
    int? time,
  }) async {
    try {
      final _dio = Dio(
        BaseOptions(
          baseUrl: ApiClient.baseUrl,
          headers: {"Accept": ApiClient.headers},
        ),
      );
      final responce = await _dio.post(ApiClient.bookAppointment);
      return BookingAppointmentsResponce.fromJson(responce.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data["message"];
      }
      throw RemoteException(
        message: message ?? "failed to post bookingAppointment",
      );
    }
  }

  @override
  Future<CancelMyBookingResponce> cancelBooking({String? Accept}) async {
    try {
      final _dio = Dio(
        BaseOptions(
          baseUrl: ApiClient.baseUrl,
          headers: {"Accept": ApiClient.headers},
        ),
      );
      final responce = await _dio.post(ApiClient.cancelAppointment);
      return CancelMyBookingResponce.fromJson(responce.data);
    } catch (exeption) {
      String? message;
      if (exeption is DioException) {
        message = exeption.response?.data["message"];
      }
      throw RemoteException(
        message: message ?? "failed to cancel appointments",
      );
    }
  }

  @override
  Future<MyBookingResponce> mybooking({String? Accept}) async {
    try {
      final _dio = Dio(
        BaseOptions(
          baseUrl: ApiClient.baseUrl,
          headers: {"Accept": ApiClient.headers},
        ),
      );
      final responce = await _dio.get(ApiClient.mybookings);
      return MyBookingResponce.fromJson(responce.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data["message"];
      }
      throw RemoteException(message: message ?? "failed to get my booking");
    }
  }

  @override
  Future<ReschedualMybookingResponce> reschedualBooking({

    int? appointmentDate,
    int? appointmentTime,
  }) async {
try{    final _dio = Dio(
      BaseOptions(
        baseUrl: ApiClient.baseUrl,
        headers: {"Accept": ApiClient.headers},
      ),
    );
    final responce = await _dio.post(ApiClient.rescheduleAppointment);
    return ReschedualMybookingResponce.fromJson(responce.data);}catch(exception){
      String ?message;
if( exception is DioException){
  message=exception.response?.data["message"];
}   throw RemoteException(message: message??"failed to reschedualBooking");
    }

  }
}
