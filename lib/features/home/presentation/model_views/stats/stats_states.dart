import 'package:equatable/equatable.dart';

import '../../../data/models/statistics_model.dart';

abstract class StatsStates extends Equatable {
  const StatsStates();

  @override
  List<Object> get props => [];
}

class StatsInitialState extends StatsStates {}

class StatsLoadingState extends StatsStates {}

class StatsSuccessState extends StatsStates {
  final List<StatisticsModel> stats;

  const StatsSuccessState(this.stats);

  @override
  List<Object> get props => [stats];
}

class StatsFailureState extends StatsStates {
  final String errorMessage;

  const StatsFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
