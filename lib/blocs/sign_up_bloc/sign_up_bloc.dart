import 'package:e_commerce_app/features/sign_up/presentation/pages/sign_up_page.dart';
import 'package:e_commerce_app/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepository;

  SignUpBloc({required this.authRepository})
      : super(const SignUpInitial(isLoading: false)) {
    on<SignUpLoaded>((event, emit) async {
      emit(const SignUpFailed(isLoading: true));
      try {
        await authRepository.createUserWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(const SignUpSuccess(isLoading: false));
      } on FirebaseAuthException catch (e) {
        authErrorSignUp = e.toString();
        emit(const SignUpFailed(isLoading: false));
      }
    });
  }
}
