class CancelMyBookingResponce {
  final bool? status;
  final String? message;

  const CancelMyBookingResponce({this.status, this.message});

  factory CancelMyBookingResponce.fromJson(Map<String, dynamic> json) {
    return CancelMyBookingResponce(
      status: json['status'] as bool?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'status': status, 'message': message};
}
