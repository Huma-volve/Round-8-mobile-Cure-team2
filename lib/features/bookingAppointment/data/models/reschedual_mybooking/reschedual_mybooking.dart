import 'ReschedualMybookingModel.dart';

class ReschedualMybookingResponce {
  final bool status;
  final String message;
  final ReschedualMybookingModel data;

  const ReschedualMybookingResponce({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ReschedualMybookingResponce.fromJson(Map<String, dynamic> json) {
    return ReschedualMybookingResponce(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: ReschedualMybookingModel.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data.toJson(),
  };
}
