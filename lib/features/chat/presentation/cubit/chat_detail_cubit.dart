import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cure_team_2/features/chat/domain/entities/message_entity.dart';
import 'package:cure_team_2/features/chat/domain/repositories/chat_repository.dart';

// States
abstract class ChatDetailState extends Equatable {
  const ChatDetailState();
  @override
  List<Object> get props => [];
}

class ChatDetailInitial extends ChatDetailState {}

class ChatDetailLoading extends ChatDetailState {}

class ChatDetailLoaded extends ChatDetailState {
  final List<MessageEntity> messages;
  const ChatDetailLoaded(this.messages);
  @override
  List<Object> get props => [messages];
}

class ChatDetailError extends ChatDetailState {
  final String message;
  const ChatDetailError(this.message);
  @override
  List<Object> get props => [message];
}

// Cubit
class ChatDetailCubit extends Cubit<ChatDetailState> {
  final ChatRepository repository;

  ChatDetailCubit(this.repository) : super(ChatDetailInitial());

  Future<void> loadMessages(String chatId) async {
    emit(ChatDetailLoading());
    try {
      final messages = await repository.getMessages(chatId);
      emit(ChatDetailLoaded(messages));
    } catch (e) {
      emit(ChatDetailError(e.toString()));
    }
  }

  Future<void> sendMessage(String chatId, String content) async {
    if (content.trim().isEmpty) return;

    // Optimistic update could go here, but for simplicity we'll reload
    // or we can manually emit the new state if we want better UX
    try {
      final currentState = state;
      List<MessageEntity> currentMessages = [];
      if (currentState is ChatDetailLoaded) {
        currentMessages = List.from(currentState.messages);
      }

      // Temporary local append for optimistic UI (optional, but good)
      final tempMessage = MessageEntity(
          id: 'temp_${DateTime.now()}',
          senderId: 'current_user', // Mock user ID
          content: content,
          type: MessageType.text,
          timestamp: DateTime.now());

      emit(ChatDetailLoaded([...currentMessages, tempMessage]));

      await repository.sendMessage(chatId, content, MessageType.text);

      // Reload to confirm sync
      loadMessages(chatId);
    } catch (e) {
      emit(ChatDetailError(e.toString()));
    }
  }
}
