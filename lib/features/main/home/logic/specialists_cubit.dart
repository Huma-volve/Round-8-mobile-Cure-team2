import 'package:bloc/bloc.dart';
import 'package:cure_team_2/core/cubit/base_state.dart';
import 'package:cure_team_2/core/extensions/safe_emit.dart';
import 'package:cure_team_2/core/models/specialists_model.dart';
import 'package:cure_team_2/features/main/home/data/repository/home_repository.dart';

class SpecialistsCubit extends Cubit<BaseState<List<SpecialistsModel>>> {
  final HomeRepository _repository;

  SpecialistsCubit(this._repository) : super(const BaseState.initial());

  Future<void> get() async {
    safeEmit(const BaseState.loading());
    final result = await _repository.getSpecialists();
    result.fold((error) => safeEmit(BaseState.failure(error)),
        (specialists) {
      if(specialists.isEmpty)return safeEmit(const BaseState.empty()) ;
          safeEmit(BaseState.success(specialists));
        });
  }
}
