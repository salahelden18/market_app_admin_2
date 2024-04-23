import 'package:equatable/equatable.dart';

abstract class AutoAuthenticationStates extends Equatable {
  const AutoAuthenticationStates();
  @override
  List<Object> get props => [];
}

class AutoAuthenticationInitialState extends AutoAuthenticationStates {}

class AutoAuthenticationLoadingState extends AutoAuthenticationStates {}

class AutoAuthenticationAuthenticatedState extends AutoAuthenticationStates {}

class AutoAuthenticationUnAuthenticatedState extends AutoAuthenticationStates {}
