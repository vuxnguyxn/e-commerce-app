part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInLoaded extends SignInEvent {
  final String email;
  final String password;

  const SignInLoaded({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
