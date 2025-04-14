part of 'auth_bloc.dart';

abstract class AuthEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateFullName extends AuthEvents {
  final String fullName;
  UpdateFullName(this.fullName);
}

class UpdateEmail extends AuthEvents {
  final String email;
  UpdateEmail(this.email);
}

class UpdatePassword extends AuthEvents {
  final String password;
  UpdatePassword(this.password);
}

class UpdateConfirmPassword extends AuthEvents {
  final String confirmPassword;
  UpdateConfirmPassword(this.confirmPassword);
}

class MatchPassword extends AuthEvents {
  final String password;
  final String confirmPassword;
  MatchPassword(this.password, this.confirmPassword);
}

class SubmitButton extends AuthEvents {}
