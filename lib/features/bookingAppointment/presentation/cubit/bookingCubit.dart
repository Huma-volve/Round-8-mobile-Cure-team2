import 'package:cure_team_2/features/bookingAppointment/data/repositories/booking_Repository.dart';
import 'package:cure_team_2/features/bookingAppointment/presentation/cubit/Booking_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class Bookingcubit extends Cubit<BookingState> {
  Bookingcubit(super.initialState, this._bookingRepository);
  final BookingRepository _bookingRepository;
  Future<void> bookingAppointment({int? doctorId, int? date, int? time}) async {
    if (isClosed) {
      return;
    }
    emit(LoadingBookingState());
    final result = await _bookingRepository.bookingsAppointment(
      doctorId: doctorId,
      date: date,
      time: time,
    );
    result.fold(
      // ignore: non_constant_identifier_names
      (Failure) => emit(ErrorBookingState(Failure.message!)),

      // ignore: non_constant_identifier_names
      (bookingAppointment) =>
          emit(SuccessBookingAppointmentState(bookingAppointment)),
    );
  }

  Future<void> mybookings() async {
    if (isClosed) {
      return;
    }
    emit(LoadingBookingState());

    final result = await _bookingRepository.mybookings();
    result.fold(
      (Failure) => emit(ErrorBookingState(Failure.message!)),

      // ignore: non_constant_identifier_names
      (mybooking) => emit(SuccessMyBookingState(mybooking)),
    );
  }

  Future<void> cancelBooking() async {
    if (isClosed) {
      return;
    }
    emit(LoadingBookingState());
    final result = await _bookingRepository.cancelbooking();
    result.fold(
      (failure) => emit(ErrorBookingState(failure.message!)),

      // ignore: non_constant_identifier_names
      (cancel) => emit(SuccessCancelBookingState(cancel)),
    );
  }

  Future<void> reschedualBooking({
    int? appointmentDate,
    int? appointmentTime,
  }) async {
    if (isClosed) {
      return;
    }
    emit(LoadingBookingState());
    final result = await _bookingRepository.reschedualbooking(
      appointmentDate: appointmentDate,
      appointmentTime: appointmentTime,
    );
    result.fold(
      (failure) => emit(ErrorBookingState(failure.message!)),

      (reschedual) => emit(SuccessReschedualBookingState(reschedual)),
    );
  }
}
