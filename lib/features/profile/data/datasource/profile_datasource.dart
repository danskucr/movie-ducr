import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_ducr/features/profile/data/models/profile_reseponse.dart';


class ProfileDatasource {
    Future<ProfileResponse> getProfile() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/account/20976799'),
        headers:  {
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNmMxNTE1MWQyY2YyMTlkMmE3MzY4ZWNmNTQ4ODdiNiIsInN1YiI6IjY1YzU4ZWE2NDFlZWUxMDBjODk0YTk2NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ZfJW_KJW1Qs5Gp0_WXah4DIt3eNb65c-yRB5a7wKxoM'});
    var movies = ProfileResponse.fromJson(jsonDecode(response.body));
    print(response.statusCode);
    return movies;
  }
}