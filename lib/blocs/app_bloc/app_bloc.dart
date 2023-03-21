import 'package:e_commerce_app/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc()
      : super(const AppStateLoggedOut(isLoading: false, successful: false)) {
    on<AppEventSignIn>((event, emit) async {
      emit(const AppStateLoggedOut(isLoading: true, successful: false));
      try {
        await AuthRepository().signInWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(const AppStateLoggedIn(isLoading: false, successful: true));
      } on FirebaseAuthException catch (e) {
        authErrorSignIn = e.toString();
        emit(const AppStateLoggedOut(isLoading: false, successful: false));
      }
    });

    on<AppEventSignOut>((event, emit) async {
      emit(const AppStateLoggedOut(isLoading: true, successful: false));
      try {
        await AuthRepository().signOut();
        emit(const AppStateLoggedOut(isLoading: false, successful: true));
      } on FirebaseAuthException catch(_){}
    });

    on<AppEventSignUp>((event, emit) async {
      emit(const AppStateLoggedOut(isLoading: true, successful: false));
      try {
        await AuthRepository().createUserWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(const AppStateLoggedIn(isLoading: false, successful: true));
      } on FirebaseAuthException catch (e) {
        authErrorSignUp = e.toString();
        emit(const AppStateLoggedOut(isLoading: false, successful: false));
      }
    });

    on<AppEventResetPassword>((event, emit) async {
      emit(const AppStateLoggedOut(isLoading: true, successful: false));
      try {
        await AuthRepository().sendPasswordResetEmail(email: event.email);
        emit(const AppStateLoggedIn(isLoading: false, successful: true));
      } on FirebaseAuthException catch (e) {
        authErrorResetPassword = e.toString();
        emit(const AppStateLoggedOut(isLoading: false, successful: false));
      }
    });
  }
}
