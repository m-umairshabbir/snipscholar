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
    on<RegisterUserEvent>(_onRegister);

    on<LoginUserEvent>(_onLogin);
  }

  Future<void> _onRegister(RegisterUserEvent event, Emitter<AuthState> emit) async {

    try {
      await authRepository.registerUser(
        fullName: event.fullName,
        email: event.email,
        password: event.password,
      );
      emit(state.copyWith(isLoading: false, message: "Registration successful",authState: true));

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
      emit(state.copyWith(isLoading: false, authState:false,message: errorMessage));

    }

  }



  Future<void> _onLogin(LoginUserEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true,authState: false, message: ""));

    try {
      final userCredentials = await authRepository.loginUser(
        email: event.email,
        password: event.password,
      );

      if (userCredentials != null) {
        emit(state.copyWith(
          isLoading: false,
          message: "Login successful",
          authState: true,
        ));


      }else{
        emit(state.copyWith(
          isLoading: false,
          message: "Login failed",
          authState: false,
        ));
      }
    } catch (e) {
      String errorMessage = "Login failed. Please try again.";

      if (e is SocketException) {
        errorMessage = "No internet connection.";
      } else if (e is HttpException) {
        errorMessage = "Unable to reach server.";
      } else if (e is FormatException) {
        errorMessage = "Invalid response format.";
      }

      emit(state.copyWith(isLoading: false,authState: false, message: errorMessage));

    }
  }


}
