import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cure_team_2/features/chat/domain/entities/chat_entity.dart';
import 'package:cure_team_2/features/chat/domain/repositories/chat_repository.dart';
import 'dart:async';

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
  Timer? _searchDebounce;
  String _activeQuery = '';

  ChatListCubit(this.repository) : super(ChatListInitial());

  Future<void> loadChats() async {
    _searchDebounce?.cancel();
    _activeQuery = '';
    emit(ChatListLoading());
    try {
      final chats = await repository.getChats();
      emit(ChatListLoaded(chats));
    } catch (e) {
      emit(ChatListError(e.toString()));
    }
  }

  Future<void> searchChats(String query) async {
    _searchDebounce?.cancel();
    final trimmedQuery = query.trim();
    _activeQuery = trimmedQuery;
    if (trimmedQuery.isEmpty) {
      await loadChats();
      return;
    }
    _searchDebounce = Timer(const Duration(milliseconds: 300), () async {
      emit(ChatListLoading());
      try {
        final chats = await repository.searchChats(trimmedQuery);
        if (trimmedQuery != _activeQuery) {
          return;
        }
        emit(ChatListLoaded(chats));
      } catch (e) {
        emit(ChatListError(e.toString()));
      }
    });
  }

  Future<void> loadFavoriteChats() async {
    _searchDebounce?.cancel();
    _activeQuery = '';
    emit(ChatListLoading());
    try {
      final chats = await repository.getFavoriteChats();
      emit(ChatListLoaded(chats));
    } catch (e) {
      emit(ChatListError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _searchDebounce?.cancel();
    return super.close();
  }
}
