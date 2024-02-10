

import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movie_ducr/core/data/application_preferences.dart';
import 'package:movie_ducr/core/service_locator.dart';
import 'package:movie_ducr/features/profile/data/models/profile_reseponse.dart';
import 'package:movie_ducr/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:movie_ducr/features/profile/presentation/bloc/profile/profile_state.dart';

class ProfileBloc extends Cubit<ProfileState> {
  final ProfileUc _profileUc;

  ProfileBloc({required ProfileUc profileUc})
      : _profileUc = profileUc,
        super(ProfileLoading());
  final ApplicationPreferences _applicationPreferences =
      sl<ApplicationPreferences>();
      
  Future<bool> isInternetConnected() async {
    try {
    bool result = await InternetConnectionChecker().hasConnection;
    if(result == true) {
      return true;
    } else {
      return false;
    }
    } catch (e) {
      return false;
    }

  }
  late ProfileResponse response;

  getProfile() async {
    late bool internet;
    try {
      emit(ProfileLoading());
      internet = await isInternetConnected();
      if (internet) {
        response = await _profileUc.call();
        _applicationPreferences.saveProfile(response.toString());

      } else {
        _applicationPreferences.getProfile().then((value) => {
          response = jsonDecode(value)
        });
      }
      emit(ProfileLoaded(response));
    } on ProfileException catch (error) {
      emit(ProfileError(error.message));
    }
  }
}
