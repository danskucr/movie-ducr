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
    // return SingleChildScrollView(
    //           child: Container(
    //             height: 500,
    //             child: Column(
    //               children: [
    //                 Expanded(
    //                   child: ListView.separated(
    //                     separatorBuilder: (_, index) {
    //                       return const SizedBox(
    //                         height: 8,
    //                       );
    //                     },
    //                     itemCount: 1,
    //                     itemBuilder: (context, index) {
    //                       return MovieRow();
    //                     },
    //                   ),
    //                 ),
    //               ],

    //             ),
    //           )
    //         );
    
    return BlocConsumer<MovieBloc, MovieState>(
      listener: (context, state) {
        if (state is MoviesError) {
          print('ERROR AL OBTENER INFORMACION');
        }
      },
      builder:  (context, state) {
        if (state is MovieLoading) {
          return const Center(
            child: CircularProgressIndicator()
          );
        } else if (state is MovieLoaded){
          return state.movies.results.isEmpty
            ? SingleChildScrollView(
              child: Container(
                height: 500,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (_, index) {
                          return const SizedBox(
                            height: 8,
                          );
                        },
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return MovieRow(movie: state.movies.results[index],);
                        },
                      ),
                    ),
                  ],

                ),
              )
            )
             : Container(
                  height: 100,
                  child: ListView(
                    children: [
                      Center(
                            child: Text(
                              'No hay peliculas que mostrar'
                            ),
                      ),
                    ],
                  ),
                );
        }
        return Container();
      }
    );
  }
}