import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:snipscholar/core/repositories/authRepo/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(const AuthState()) {
    on<SubmitButton>(_onSubmit);
    on<ShowFlushbar>(_onShowFlushbar);
  }

  Future<void> _onSubmit(SubmitButton event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true, message: ""));

    if (event.password != event.confirmPassword) {
      emit(state.copyWith(isLoading: false, message: "Passwords do not match"));
      return;
    }

    try {
      await authRepository.registerUser(
        fullName: event.fullName,
        email: event.email,
        password: event.password,
      );
      emit(state.copyWith(isLoading: false, message: "Registration successful",authState: true));
      add(const ShowFlushbar(
        message: "Registration successful",
        flushbarBgc: Colors.green, flushbarIcon: Icon(Icons.check,color: Colors.white,), // Success color
      ));
    } catch (e) {
      String errorMessage = "An error occurred. Please try again."; // Default message

      // Check for specific exception types to handle
      if (e is SocketException) {
        errorMessage = "No internet connection.";
      } else if (e is HttpException) {
        errorMessage = "Unable to reach server.";
      } else if (e is FormatException) {
        errorMessage = "Invalid data format.";
      }
      // You can add more specific exceptions here if needed

      // Triggering the Flushbar event on error
      emit(state.copyWith(isLoading: false, message: errorMessage));
      add(ShowFlushbar(
        message: errorMessage,  // Concise error message
        flushbarBgc: Colors.red,
        flushbarIcon: const Icon(Icons.error,color: Colors.white,)// Error color
      ));
    }

  }

  FutureOr<void> _onShowFlushbar(ShowFlushbar event, Emitter<AuthState> emit) {
    emit(state.copyWith(message: event.message, flushbarBgc: event.flushbarBgc));
  }
}
