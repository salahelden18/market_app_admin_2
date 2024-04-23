import 'package:equatable/equatable.dart';

class AuthenticationModel extends Equatable {
  final String userId;
  final String role;
  final String token;
  final String? message;

  const AuthenticationModel(
      {required this.message,
      required this.role,
      required this.token,
      required this.userId});

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationModel(
        message: json['message'],
        role: json['role'],
        token: json['token'],
        userId: json['userId']);
  }

  @override
  List<Object?> get props => [userId, role, token, message];
}
