import 'package:e_commerce_app/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_profile_event.dart';
part 'update_profile_state.dart';

class UpdateProfileBloc
    extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  AuthRepository authRepository;
  UpdateProfileBloc({required this.authRepository})
      : super(const UpdateProfileInitial(isLoading: false)) {
    on<UpdateProfileLoaded>(
      (event, emit) async {
        emit(const UpdateProfileFailed(isLoading: true));
        try {
          await authRepository.updateProfile(
              displayName: event.displayName,
              phone: event.phone,
              birthday: event.birthday,
              gender: event.gender,
              username: event.username,
              country: event.country,
              photoURL: event.photoURL);
          emit(const UpdateProfileSuccess(isLoading: false));
        } on FirebaseException catch (e) {
          authErrorUpdateProfile = e.toString();
          emit(const UpdateProfileFailed(isLoading: false));
        }
      },
    );
  }
}
