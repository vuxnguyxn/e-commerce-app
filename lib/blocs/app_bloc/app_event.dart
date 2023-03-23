part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

@immutable
class AppEventSignIn extends AppEvent {
  final String email;
  final String password;

  const AppEventSignIn({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

@immutable
class AppEventSignUp extends AppEvent {
  final String email;
  final String password;

  const AppEventSignUp({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

@immutable
class AppEventResetPassword extends AppEvent {
  final String email;

  const AppEventResetPassword({required this.email});

  @override
  List<Object> get props => [email];
}

@immutable
class AppEventSignOut extends AppEvent {}

@immutable
class AppEventUpdateProfile extends AppEvent {
  final String displayName;
  final String photoURL;
  final String birthday;
  final String username;
  final String gender;
  final String phone;
  final String country;
  final BuildContext context;

  const AppEventUpdateProfile(
      {required this.birthday,
      required this.username,
      required this.gender,
      required this.context,
      required this.phone,
      required this.country,
      required this.displayName,
      required this.photoURL});

  @override
  List<Object> get props =>
      [displayName, photoURL, country, birthday, username, gender, phone];
}
