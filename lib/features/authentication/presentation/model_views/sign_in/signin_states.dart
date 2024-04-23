import 'package:equatable/equatable.dart';
import 'package:market_app_web_2/features/authentication/data/models/authentication_model.dart';

abstract class SiginStates extends Equatable {
  const SiginStates();

  @override
  List<Object> get props => [];
}

class SiginInitialState extends SiginStates {}

class SiginLoadingState extends SiginStates {}

class SiginSuccessState extends SiginStates {
  final AuthenticationModel authenticationModel;

  const SiginSuccessState(this.authenticationModel);

  @override
  List<Object> get props => [authenticationModel];
}

class SiginFailureState extends SiginStates {
  final String errorMessage;

  const SiginFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
