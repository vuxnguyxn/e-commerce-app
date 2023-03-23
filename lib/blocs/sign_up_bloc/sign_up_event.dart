part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpLoaded extends SignUpEvent {
  final String email;
  final String password;

  const SignUpLoaded({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
