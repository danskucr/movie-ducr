import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_ducr/features/movies/data/models/movie_response.dart';

class MovieDatasourse {
    Future<MovieResponse> getMovies() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc'),
        headers:  {
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNmMxNTE1MWQyY2YyMTlkMmE3MzY4ZWNmNTQ4ODdiNiIsInN1YiI6IjY1YzU4ZWE2NDFlZWUxMDBjODk0YTk2NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ZfJW_KJW1Qs5Gp0_WXah4DIt3eNb65c-yRB5a7wKxoM'});
    var movies = MovieResponse.fromJson(jsonDecode(response.body));
    print(response.statusCode);
    print(response.body);
    return movies;
  }
}