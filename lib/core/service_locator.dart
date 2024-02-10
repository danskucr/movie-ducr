import 'package:get_it/get_it.dart';
import 'package:movie_ducr/core/data/application_preferences.dart';
import 'package:movie_ducr/features/movies/sl.dart';
import 'package:movie_ducr/features/profile/sl.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  _initCore();
  _initFeatures();
}

void _initCore() {
  sl.registerLazySingleton(() => ApplicationPreferences());
}

void _initFeatures() async {
  initFeatureProfile();
  initFeatureMovie();
}