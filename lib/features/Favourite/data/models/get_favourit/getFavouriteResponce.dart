import 'getFavouriteModel.dart';

class getFavouriteResponce {
  final bool? status;
  final String? message;
  final List<Getfavouritemodel>? data;

  const getFavouriteResponce({this.status, this.message, this.data});

  factory getFavouriteResponce.fromJson(Map<String, dynamic> json) =>
      getFavouriteResponce(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data:
            (json['data'] as List<dynamic>?)
                ?.map(
                  (e) => Getfavouritemodel.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
      );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.map((e) => e.toJson()).toList(),
  };
}
