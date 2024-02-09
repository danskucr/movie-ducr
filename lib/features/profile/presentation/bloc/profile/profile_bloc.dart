

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ducr/features/profile/data/models/profile_reseponse.dart';
import 'package:movie_ducr/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:movie_ducr/features/profile/presentation/bloc/profile/profile_state.dart';

class ProfileBloc extends Cubit<ProfileState> {
  final ProfileUc _profileUc;

  ProfileBloc({required ProfileUc profileUc})
      : _profileUc = profileUc,
        super(ProfileLoading());
  getProfile() async {
    try {
      emit(ProfileLoading());
      ProfileResponse indicesResponse =
          await _profileUc.call();
      emit(ProfileLoaded(indicesResponse));
    } on ProfileException catch (error) {
      emit(ProfileError(error.message));
    }
  }
}
