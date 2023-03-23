import 'package:e_commerce_app/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<AppLoader>((event, emit) async {
      try {
        if (await authRepository.isSignIn()) {
          emit(Authenticated());
        }
      } catch (_) {
        emit(UnAuthenticated());
      }
    });

    on<AppSignOut>((event, emit) async {
      try {
        await authRepository.signOut();
        emit(UnAuthenticated());
      } catch (_) {}
    });
  }
}
