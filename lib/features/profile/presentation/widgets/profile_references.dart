import 'package:flutter/material.dart';
import 'package:movie_ducr/features/profile/data/models/profile_reseponse.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileReferences extends StatefulWidget {
  final ProfileResponse profile;
  const ProfileReferences({super.key, required this.profile});

  @override
  State<ProfileReferences> createState() => _ProfileReferenceState();
}
  Future<void> linkTo(String url) async {
    await launch(
      url,
      forceWebView: true,
      headers:  <String, String>{'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNmMxNTE1MWQyY2YyMTlkMmE3MzY4ZWNmNTQ4ODdiNiIsInN1YiI6IjY1YzU4ZWE2NDFlZWUxMDBjODk0YTk2NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ZfJW_KJW1Qs5Gp0_WXah4DIt3eNb65c-yRB5a7wKxoM'}
    );
  }
class _ProfileReferenceState extends State<ProfileReferences> {
  TextStyle style() {
    return const TextStyle(
      fontSize: 15,
      color: Colors.black,
      fontFamily: 'Calibri',
    );
  }
  TextStyle styleLink() {
    return const TextStyle(
      fontSize: 13,
      color: Colors.blue,
      fontFamily: 'Calibri',
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Text('Aqui se muestra las referencias que se tomaron para cada una de las API de la pagina TMDB. \n(Dar clic para consultar la pagina de API)',
            style: style(),
        ),
        rowInfo('Profile: ', 'https://api.themoviedb.org/3/account/20976799'),
        rowInfo('Movies: ', 'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc'),
      ],
    );
  }
  rowInfo(String left, String right){
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(left,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black,
              fontFamily: 'Calibri',
              fontWeight: FontWeight.bold
            ),
            overflow: TextOverflow.ellipsis,
          ),
          TextButton(
            onPressed: (){
              linkTo(right);
            },
            child: Text(right,
              style: styleLink(),
              overflow: TextOverflow.ellipsis,
            )
          )

      ],),
    );
  }
}

