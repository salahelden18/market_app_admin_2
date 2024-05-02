import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/features/home/data/repo/home_repo.dart';

import 'stats_states.dart';

class StatsCubit extends Cubit<StatsStates> {
  StatsCubit(this._homeRepo) : super(StatsInitialState());

  final HomeRepo _homeRepo;

  Future getStats() async {
    emit(StatsLoadingState());

    var result = await _homeRepo.getStatistics();

    result.fold(
      (l) => emit(StatsFailureState(l.message)),
      (r) => emit(
        StatsSuccessState(r!),
      ),
    );
  }
}
