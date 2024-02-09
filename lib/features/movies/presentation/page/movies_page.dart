import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ducr/core/service_locator.dart';
import 'package:movie_ducr/features/movies/presentation/bloc/movies/movie_bloc.dart';
import 'package:movie_ducr/features/movies/presentation/widgets/movie_info.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(
          create: (BuildContext context) {
            return sl<MovieBloc>()..getMovies();
          },
        ),
      ],
      child: MovieInfo(),
    );
  }
}