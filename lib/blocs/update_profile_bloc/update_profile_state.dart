part of 'update_profile_bloc.dart';

abstract class UpdateProfileState extends Equatable {
  final bool isLoading;
  const UpdateProfileState({required this.isLoading});

  @override
  List<Object> get props => [];
}

class UpdateProfileInitial extends UpdateProfileState {
  const UpdateProfileInitial({
    required isLoading,
  }) : super(
          isLoading: isLoading,
        );

  @override
  List<Object> get props => [isLoading];
}
class UpdateProfileSuccess extends UpdateProfileState {
  const UpdateProfileSuccess({
    required isLoading,
  }) : super(
          isLoading: isLoading,
        );

  @override
  List<Object> get props => [isLoading];
}

class UpdateProfileFailed extends UpdateProfileState {
  const UpdateProfileFailed({
    required isLoading,
  }) : super(
          isLoading: isLoading,
        );

  @override
  List<Object> get props => [isLoading];
}

