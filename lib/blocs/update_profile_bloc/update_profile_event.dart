part of 'update_profile_bloc.dart';

abstract class UpdateProfileEvent extends Equatable {
  const UpdateProfileEvent();

  @override
  List<Object> get props => [];
}

class UpdateProfileLoaded extends UpdateProfileEvent{
  final String displayName;
  final String photoURL;
  final String birthday;
  final String username;
  final String gender;
  final String phone;
  final String country;
  

  const UpdateProfileLoaded(
      {required this.birthday,
      required this.username,
      required this.gender,
      required this.phone,
      required this.country,
      required this.displayName,
      required this.photoURL});

  @override
  List<Object> get props =>
      [displayName, photoURL, country, birthday, username, gender, phone];
}