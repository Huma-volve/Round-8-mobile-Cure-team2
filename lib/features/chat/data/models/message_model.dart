import 'package:cure_team_2/features/chat/domain/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  const MessageModel({
    required super.id,
    required super.senderId,
    required super.content,
    required super.type,
    required super.timestamp,
    super.isRead,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    final rawType = json['type'];
    final parsedType = MessageType.values.firstWhere(
      (type) => type.name == rawType?.toString().toLowerCase(),
      orElse: () => MessageType.text,
    );
    final rawTimestamp = json['timestamp'] ?? json['created_at'];
    final parsedTimestamp =
        DateTime.tryParse(rawTimestamp?.toString() ?? '') ?? DateTime.now();
    final rawIsRead = json['isRead'] ?? json['is_read'];
    final parsedIsRead =
        rawIsRead is bool
            ? rawIsRead
            : rawIsRead?.toString().toLowerCase() == 'true' ||
                rawIsRead?.toString() == '1';
    return MessageModel(
      id: json['id']?.toString() ?? '',
      senderId: (json['senderId'] ?? json['sender_id'])?.toString() ?? '',
      content: (json['content'] ?? json['message'] ?? '').toString(),
      type: parsedType,
      timestamp: parsedTimestamp,
      isRead: parsedIsRead || json['read_at'] != null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'content': content,
      'type': type.name,
      'timestamp': timestamp.toIso8601String(),
      'isRead': isRead,
    };
  }
}
