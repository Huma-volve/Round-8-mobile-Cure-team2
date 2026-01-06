import 'package:cure_team_2/features/chat/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({required super.id, required super.name, super.avatarUrl});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toString() ?? '',
      name: (json['name'] ?? json['full_name'] ?? '').toString(),
      avatarUrl:
          (json['avatarUrl'] ?? json['avatar_url'] ?? json['image'])
              ?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'avatarUrl': avatarUrl};
  }
}
