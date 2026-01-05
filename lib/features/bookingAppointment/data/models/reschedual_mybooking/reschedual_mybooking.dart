import 'data.dart';

class ReschedualMybooking {
  final bool? status;
  final String? message;
  final Data? data;

  const ReschedualMybooking({this.status, this.message, this.data});

  factory ReschedualMybooking.fromJson(Map<String, dynamic> json) {
    return ReschedualMybooking(
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
