import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 2)); // Simulating API delay
      if (event.email == "admin@test.com" && event.password == "password") {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure(message: "Invalid credentials"));
      }
    });

    on<SignupRequested>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 2)); // Simulating API delay
      if (event.email.contains("@") && event.password.length >= 6) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure(message: "Invalid registration details"));
      }
    });
  }
}
