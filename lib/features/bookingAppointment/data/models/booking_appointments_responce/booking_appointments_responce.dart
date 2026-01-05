import 'data.dart';

class BookingAppointmentsResponce {
  final bool? status;
  final String? message;
  final Data? data;

  const BookingAppointmentsResponce({this.status, this.message, this.data});

  factory BookingAppointmentsResponce.fromJson(Map<String, dynamic> json) {
    return BookingAppointmentsResponce(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data:
          json['data'] == null
              ? null
              : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.toJson(),
  };
}
