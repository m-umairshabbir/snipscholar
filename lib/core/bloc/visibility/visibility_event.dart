import 'package:equatable/equatable.dart';

abstract class VisibilityEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TogglePasswordVisibility extends VisibilityEvent {}
class ToggleConfirmPasswordVisibility extends VisibilityEvent {}
