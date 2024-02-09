
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ducr/features/movies/data/models/movie_response.dart';
import 'package:movie_ducr/features/movies/domain/usecases/get_movies_usecases.dart';
import 'package:movie_ducr/features/movies/presentation/bloc/movies/movies_state.dart';

class MovieBloc extends Cubit<MovieState> {
  final MoviesUc _moviesUc;

  MovieBloc({required MoviesUc moviesUc})
      : _moviesUc = moviesUc,
        super(MovieLoading());
  getMovies() async {
    try {
      emit(MovieLoading());
      MovieResponse indicesResponse =
          await _moviesUc.call();
      emit(MovieLoaded(indicesResponse));
    } on MovieException catch (error) {
      emit(MoviesError(error.message));
    }
  }
}
