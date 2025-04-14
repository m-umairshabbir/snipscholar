part of 'auth_bloc.dart';

class AuthStates extends Equatable {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;
  final String message;
  final bool isLoading;

  const AuthStates({
    this.fullName = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.message = '',
    this.isLoading = false,
  });

  AuthStates copyWith({
    String? fullName,
    String? email,
    String? password,
    String? confirmPassword,
    String? message,
    bool? isLoading,
  }) {
    return AuthStates(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      message: message ?? this.message,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [fullName, email, password, confirmPassword, message, isLoading];
}
