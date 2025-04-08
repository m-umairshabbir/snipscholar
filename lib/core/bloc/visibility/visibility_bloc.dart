import 'package:flutter_bloc/flutter_bloc.dart';
import 'visibility_event.dart';
import 'visibility_state.dart';

class VisibilityBloc extends Bloc<VisibilityEvent, VisibilityState> {
  VisibilityBloc() : super(const VisibilityInitial()) {
    on<TogglePasswordVisibility>((event, emit) {
      emit(PasswordVisibilityChanged(
        isPasswordVisible: !state.isPasswordVisible,
        isConfirmPasswordVisible: state.isConfirmPasswordVisible,
      ));
    });

    on<ToggleConfirmPasswordVisibility>((event, emit) {
      emit(PasswordVisibilityChanged(
        isPasswordVisible: state.isPasswordVisible,
        isConfirmPasswordVisible: !state.isConfirmPasswordVisible,
      ));
    });
  }
}
