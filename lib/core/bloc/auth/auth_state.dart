part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool isLoading;
  final String message;
  final bool authState;

  const AuthState({
    this.isLoading = false,
    this.authState=false,
    this.message = '',
  });

  AuthState copyWith({
    bool? isLoading,
    String? message,
    Color? flushbarBgc,
    Icon? flushbarIcon, // Allows dynamic icon
    bool? authState,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      authState: authState ?? this.authState,
    );
  }

  @override
  List<Object?> get props => [isLoading, message, authState];
}
