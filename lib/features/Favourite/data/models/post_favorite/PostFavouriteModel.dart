class PostFavouriteModel {
  final bool added;
  final bool isFavorite;

  const PostFavouriteModel({required this.added, required this.isFavorite});

  factory PostFavouriteModel.fromJson(Map<String, dynamic> json) =>
      PostFavouriteModel(
        added: json['added'] as bool,
        isFavorite: json['is_favorite'] as bool,
      );

  Map<String, dynamic> toJson() => {'added': added, 'is_favorite': isFavorite};
}
