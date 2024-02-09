import 'package:get_it/get_it.dart';
import 'package:movie_ducr/features/movies/sl.dart';
import 'package:movie_ducr/features/profile/sl.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //Core

  // await _initCore();
  //Features
   _initFeatures();
}

// void _initCore() {

// }

void _initFeatures() async {
  initFeatureProfile();
  initFeatureMovie();
}