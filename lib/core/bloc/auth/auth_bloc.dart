import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(const AuthStates()) {
    on<MatchPassword>(_onMatchPassword);
    on<SubmitButton>(_onSubmit);
    on<UpdateEmail>(_onUpdateEmail);
    on<UpdatePassword>(_onUpdatePassword);
    on<UpdateConfirmPassword>(_onUpdateConfirmPassword);
    on<UpdateFullName>(_onUpdateFullName);
  }

  void _onMatchPassword(MatchPassword event, Emitter<AuthStates> emit) {
    if (event.password != event.confirmPassword) {
      emit(state.copyWith(message: "Passwords do not match"));
    } else {
      emit(state.copyWith(message: "Passwords match"));
    }
  }

  void _onUpdateEmail(UpdateEmail event, Emitter<AuthStates> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onUpdatePassword(UpdatePassword event, Emitter<AuthStates> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onUpdateConfirmPassword(UpdateConfirmPassword event, Emitter<AuthStates> emit) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }

  void _onUpdateFullName(UpdateFullName event, Emitter<AuthStates> emit) {
    emit(state.copyWith(fullName: event.fullName));
  }

  Future<void> _onSubmit(SubmitButton event, Emitter<AuthStates> emit) async {
    emit(state.copyWith(isLoading: true, message: ""));
    if (state.password != state.confirmPassword) {
      emit(state.copyWith(isLoading: false, message: "Passwords do not match"));
      return;
    }
    try {
      await authRepository.registerUser(
        fullName: state.fullName,
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(isLoading: false, message: "Registration successful!"));
    } catch (e) {
      emit(state.copyWith(isLoading: false, message: "Registration failed. Please try again."));
    }
  }
}
