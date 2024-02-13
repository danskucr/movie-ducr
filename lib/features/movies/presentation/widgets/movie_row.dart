import 'package:flutter/material.dart';
import 'package:movie_ducr/features/movies/data/models/movie_response.dart';

class MovieRow extends StatefulWidget {
  final Result movie;
  const MovieRow({super.key, required this.movie});
  // const MovieRow({super.key});

  @override
  State<MovieRow> createState() => _MovieRowState();
}

class _MovieRowState extends State<MovieRow> {
  @override
  Widget build(BuildContext context) {
    return 
    Card(
       elevation: 4.0,
       child: Column(
         children: [
           ListTile(
             title: Text(widget.movie.title),
             subtitle: Text(widget.movie.releaseDate.toString()),
             trailing: const Icon(Icons.favorite_outline),
           ),
           SizedBox(
             height: 200.0,
             child: Ink.image(
               image: const NetworkImage(
                  // 'https://api.themoviedb.org${widget.movie.posterPath}'La imagen se consulta pero la API no trae respuesta.
                  'https://cdn.pixabay.com/photo/2015/01/11/09/19/film-596009_640.jpg'),
               fit: BoxFit.cover,
             ),
           ),
           Container(
             padding: const EdgeInsets.all(16.0),
             alignment: Alignment.centerLeft,
             child: Text(widget.movie.overview),
           ),
         ],
       ));
  }
}