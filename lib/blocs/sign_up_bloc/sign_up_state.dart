part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
   final bool isLoading;
  const SignUpState({required this.isLoading});
  
  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {
   const SignUpInitial({
    required isLoading,
  }) : super(isLoading: isLoading,);

  @override
  List<Object> get props => [isLoading];
}
class SignUpSuccess extends SignUpState {
   const SignUpSuccess({
    required isLoading,
  }) : super(isLoading: isLoading,);

  @override
  List<Object> get props => [isLoading];
}
class SignUpFailed extends SignUpState {
   const SignUpFailed({
    required isLoading,
  }) : super(isLoading: isLoading,);

  @override
  List<Object> get props => [isLoading];
}

