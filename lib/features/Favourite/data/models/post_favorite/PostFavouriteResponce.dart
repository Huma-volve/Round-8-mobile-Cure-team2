import 'PostFavouriteModel.dart';

class PostFavouriteResponce {
  final bool? status;
  final String? message;
  final PostFavouriteModel? data;

  const PostFavouriteResponce({this.status, this.message, this.data});

  factory PostFavouriteResponce.fromJson(Map<String, dynamic> json) =>
      PostFavouriteResponce(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data:
            json['data'] == null
                ? null
                : PostFavouriteModel.fromJson(
                  json['data'] as Map<String, dynamic>,
                ),
      );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.toJson(),
  };
}
