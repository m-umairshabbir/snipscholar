import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'visibility_event.dart';
part 'visibility_state.dart';

class VisibilityBloc extends Bloc<VisibilityEvent, VisibilityState> {
  VisibilityBloc() : super(const VisibilityState()) {
    on<TogglePasswordVisibility>(_togglePassword);
    on<ToggleConfirmPasswordVisibility>(_toggleConfirmPasswordVisibility);
  }
  FutureOr<void> _togglePassword(TogglePasswordVisibility event, Emitter<VisibilityState> emit) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  FutureOr<void> _toggleConfirmPasswordVisibility(ToggleConfirmPasswordVisibility event, Emitter<VisibilityState> emit) {
    emit(state.copyWith(isConfirmPasswordVisible: !state.isConfirmPasswordVisible));
  }
}
