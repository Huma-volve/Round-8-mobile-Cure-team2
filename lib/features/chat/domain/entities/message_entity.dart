import 'package:equatable/equatable.dart';

enum MessageType { text, image, audio }

class MessageEntity extends Equatable {
  final String id;
  final String senderId;
  final String content;
  final MessageType type;
  final DateTime timestamp;
  final bool isRead;

  const MessageEntity({
    required this.id,
    required this.senderId,
    required this.content,
    required this.type,
    required this.timestamp,
    this.isRead = false,
  });

  @override
  List<Object?> get props => [id, senderId, content, type, timestamp, isRead];
}
