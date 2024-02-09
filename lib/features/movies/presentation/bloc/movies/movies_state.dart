
import 'package:movie_ducr/features/movies/data/models/movie_response.dart';

abstract class MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  MovieResponse movies;

  MovieLoaded(this.movies);
}

class MoviesError extends MovieState {
  final String message;

  MoviesError(this.message);
}
