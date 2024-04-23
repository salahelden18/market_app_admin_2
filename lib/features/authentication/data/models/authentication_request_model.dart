import 'package:equatable/equatable.dart';

class AuthenticationRequestModel extends Equatable {
  final String email;
  final String password;

  const AuthenticationRequestModel(
      {required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  @override
  List<Object?> get props => [email, password];
}
