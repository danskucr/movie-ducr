
import 'package:movie_ducr/features/movies/data/datasource/movie_datasource.dart';
import 'package:movie_ducr/features/movies/data/models/movie_response.dart';

class MoviesUc {
  final MovieDatasourse _dataSource;
  MoviesUc({required MovieDatasourse dataSource})
      : _dataSource = dataSource;
  Future<MovieResponse> call() async {
    try {
      MovieResponse response;
      response = await _dataSource.getMovies();
      return response;
    } on ServerException {
      throw MovieException("Error al cargar perfil de usuario");
    }
  }
}
class ServerException implements Exception {
  final String message;
  final int statusCode;
  ServerException({this.message = '', this.statusCode = 0});
}


class MovieException implements Exception {
  final String message;
  MovieException(this.message);
}
