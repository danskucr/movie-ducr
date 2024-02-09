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
             trailing: Icon(Icons.favorite_outline),
           ),
           Container(
             height: 200.0,
             child: Ink.image(
               image: NetworkImage(
                  'https://static.wikia.nocookie.net/gatopedia/images/2/2e/El_gatoo.png/revision/latest?cb=20230103150310&path-prefix=es'),
               fit: BoxFit.cover,
             ),
           ),
           Container(
             padding: EdgeInsets.all(16.0),
             alignment: Alignment.centerLeft,
             child: Text(widget.movie.overview),
           ),
         ],
       ));
  }
}