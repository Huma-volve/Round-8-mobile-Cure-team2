class CancelMyBooking {
  final bool? status;
  final String? message;

  const CancelMyBooking({this.status, this.message});

  factory CancelMyBooking.fromJson(Map<String, dynamic> json) {
    return CancelMyBooking(
      status: json['status'] as bool?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'status': status, 'message': message};
}
