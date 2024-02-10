import 'package:hive/hive.dart';
import 'package:movie_ducr/features/movies/data/models/movie_response.dart';
import 'package:movie_ducr/features/profile/data/models/profile_adapter.dart';
import 'package:movie_ducr/features/profile/data/models/profile_reseponse.dart';

class ApplicationPreferences {
  Box? _box;

  Future<Box> _getBox() async {
    _box ??= await Hive.openBox('appPreferences');
    return _box!;
  }

  saveProfile(String profile) async {
    (await _getBox()).put('profile', profile);
  }

  Future<String> getProfile() async {
    return (await _getBox()).get('profile') ?? '';
  }

  saveMovies(String movie) async {
    (await _getBox()).put('movie', movie);
  }

  Future<String> getMovie() async {
    return (await _getBox()).get('movie') ?? '';
  }
}