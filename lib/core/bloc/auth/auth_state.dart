part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool isLoading;
  final String message;
  final Color flushbarBgc;
  final Icon flushbarIcon;
  final bool authState;

  const AuthState({
    this.flushbarBgc = Colors.transparent,
    this.isLoading = false,
    this.authState=false,
    this.message = '',
    this.flushbarIcon = const Icon(Icons.info), // Default icon
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
      flushbarBgc: flushbarBgc ?? this.flushbarBgc,
      flushbarIcon: flushbarIcon ?? this.flushbarIcon,
      authState: authState ?? this.authState,
    );
  }

  @override
  List<Object?> get props => [isLoading, message, flushbarBgc, flushbarIcon,authState];
}
