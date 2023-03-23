import 'package:e_commerce_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:e_commerce_app/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository authRepository;

  SignInBloc({required this.authRepository})
      : super(const SignInInitial(isLoading: false)) {
    on<SignInLoaded>((event, emit) async {
      emit(const SignInFailed(isLoading: true));
      try {
        await authRepository.signInWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(const SignInSuccess(isLoading: false));
      } on FirebaseAuthException catch (e) {
        authErrorSignIn = e.toString();
        emit(const SignInFailed(isLoading: false));
      }
    });
  }
}
