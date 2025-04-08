import 'package:equatable/equatable.dart';

abstract class VisibilityState extends Equatable {
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;

  const VisibilityState({required this.isPasswordVisible, required this.isConfirmPasswordVisible});

  @override
  List<Object> get props => [isPasswordVisible, isConfirmPasswordVisible];
}

class VisibilityInitial extends VisibilityState {
  const VisibilityInitial() : super(isPasswordVisible: true, isConfirmPasswordVisible: true);
}

class PasswordVisibilityChanged extends VisibilityState {
  const PasswordVisibilityChanged({required bool isPasswordVisible, required bool isConfirmPasswordVisible})
      : super(isPasswordVisible: isPasswordVisible, isConfirmPasswordVisible: isConfirmPasswordVisible);
}
