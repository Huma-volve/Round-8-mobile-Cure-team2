import 'package:equatable/equatable.dart';
import 'package:cure_team_2/features/chat/domain/entities/user_entity.dart';
import 'package:cure_team_2/features/chat/domain/entities/message_entity.dart';

class ChatEntity extends Equatable {
  final String id;
  final List<UserEntity> participants;
  final MessageEntity? lastMessage;
  final int unreadCount;

  const ChatEntity({
    required this.id,
    required this.participants,
    this.lastMessage,
    this.unreadCount = 0,
  });

  @override
  List<Object?> get props => [id, participants, lastMessage, unreadCount];
}
