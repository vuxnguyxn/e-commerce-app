// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String password;
  final String photo;

  const User({
    required this.id,
    required this.email,
    required this.password,
    required this.photo,
  });

  @override
  List<Object?> get props => [id, email, password, photo];
}
