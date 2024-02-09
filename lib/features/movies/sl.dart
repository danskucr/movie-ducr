
import 'package:movie_ducr/core/service_locator.dart';
import 'package:movie_ducr/features/movies/data/datasource/movie_datasource.dart';
import 'package:movie_ducr/features/movies/domain/usecases/get_movies_usecases.dart';
import 'package:movie_ducr/features/movies/presentation/bloc/movies/movie_bloc.dart';

void initFeatureMovie() {

  sl.registerLazySingleton(() => MovieDatasourse());

  sl.registerFactory(() => MoviesUc(dataSource: sl()));
  
  sl.registerFactory(() => MovieBloc(moviesUc: sl()));
}