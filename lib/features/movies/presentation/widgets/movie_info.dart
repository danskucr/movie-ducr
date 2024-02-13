import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ducr/features/movies/presentation/bloc/movies/movie_bloc.dart';
import 'package:movie_ducr/features/movies/presentation/bloc/movies/movies_state.dart';
import 'package:movie_ducr/features/movies/presentation/widgets/movie_row.dart';

class MovieInfo extends StatefulWidget {
  const MovieInfo({super.key});

  @override
  State<MovieInfo> createState() => _MovieInfoState();
}

class _MovieInfoState extends State<MovieInfo> {
  @override
  Widget build(BuildContext context) {
  
    return BlocBuilder<MovieBloc, MovieState>(
      builder:  (context, state) {
        if (state is MovieLoading) {
          return const Center(
            child: CircularProgressIndicator()
          );
        } else if (state is MovieLoaded){
          return state.movies.results.isNotEmpty
            ? Padding(
              padding: const EdgeInsets.all(25.0),
              child: ListView.separated(
                separatorBuilder: (_, index) {
                  return const SizedBox(
                    height: 8,
                  );
                },
                itemCount: state.movies.results.length,
                itemBuilder: (context, index) {
                  return MovieRow(movie: state.movies.results[index]);
                },
              ),
            )
             : SizedBox(
                  height: 100,
                  child: ListView(
                    children: const [
                      Center(
                            child: Text(
                              'No hay peliculas que mostrar'
                            ),
                      ),
                    ],
                  ),
                );
        }else{
          return const Center(
            child: Text("Error al consultar Perfil")
          );
        }
      }
    );
  }
}