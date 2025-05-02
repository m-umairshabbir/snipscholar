part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class SubmitButton extends AuthEvent {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;

  const SubmitButton({
    required this.fullName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props => [fullName, email, password, confirmPassword];
}
class ShowFlushbar extends AuthEvent {
  final String message;
  final Color flushbarBgc;
  final Icon flushbarIcon;
  const ShowFlushbar({
    required this.message,
    required this.flushbarBgc,
    required this.flushbarIcon
  });

  @override
  List<Object?> get props => [message, flushbarBgc,flushbarIcon];
}