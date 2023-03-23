// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

@immutable
class AuthInitial extends AuthState {}

@immutable
class Authenticated extends AuthState {}

@immutable
class UnAuthenticated extends AuthState {}
