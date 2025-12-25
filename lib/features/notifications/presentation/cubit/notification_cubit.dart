import 'package:bloc/bloc.dart';
import 'package:cure_team_2/features/notifications/domain/usecases/get_notifications_usecase.dart';
import 'package:cure_team_2/features/notifications/presentation/cubit/notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final GetNotificationsUseCase getNotificationsUseCase;

  NotificationCubit(this.getNotificationsUseCase)
    : super(NotificationInitial());

  Future<void> loadNotifications() async {
    emit(NotificationLoading());
    try {
      final notifications = await getNotificationsUseCase();
      emit(NotificationLoaded(notifications));
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }
}
