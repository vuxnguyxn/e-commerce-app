part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
   final bool isLoading;
  const SignInState({required this.isLoading});
  
  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {
   const SignInInitial({
    required isLoading,
  }) : super(isLoading: isLoading,);

  @override
  List<Object> get props => [isLoading];
}
class SignInSuccess extends SignInState {
   const SignInSuccess({
    required isLoading,
  }) : super(isLoading: isLoading,);

  @override
  List<Object> get props => [isLoading];
}
class SignInFailed extends SignInState {
   const SignInFailed({
    required isLoading,
  }) : super(isLoading: isLoading,);

  @override
  List<Object> get props => [isLoading];
}
class SignOutSuccess extends SignInState {
   const SignOutSuccess({
    required isLoading,
  }) : super(isLoading: isLoading,);

  @override
  List<Object> get props => [isLoading];
}


