import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cure_team_2/features/chat/domain/entities/chat_entity.dart';
import 'package:cure_team_2/features/chat/domain/repositories/chat_repository.dart';

// States
abstract class ChatListState extends Equatable {
  const ChatListState();
  @override
  List<Object> get props => [];
}

class ChatListInitial extends ChatListState {}

class ChatListLoading extends ChatListState {}

class ChatListLoaded extends ChatListState {
  final List<ChatEntity> chats;
  const ChatListLoaded(this.chats);
  @override
  List<Object> get props => [chats];
}

class ChatListError extends ChatListState {
  final String message;
  const ChatListError(this.message);
  @override
  List<Object> get props => [message];
}

// Cubit
class ChatListCubit extends Cubit<ChatListState> {
  final ChatRepository repository;

  ChatListCubit(this.repository) : super(ChatListInitial());

  Future<void> loadChats() async {
    emit(ChatListLoading());
    try {
      final chats = await repository.getChats();
      emit(ChatListLoaded(chats));
    } catch (e) {
      emit(ChatListError(e.toString()));
    }
  }

  Future<void> searchChats(String query) async {
    emit(ChatListLoading());
    try {
      if (query.isEmpty) {
        await loadChats();
        return;
      }
      final chats = await repository.searchChats(query);
      emit(ChatListLoaded(chats));
    } catch (e) {
      emit(ChatListError(e.toString()));
    }
  }
}
