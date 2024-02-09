import 'package:flutter/material.dart';
import 'package:movie_ducr/features/profile/data/models/profile_reseponse.dart';

class ProfileReferences extends StatefulWidget {
  final ProfileResponse profile;
  const ProfileReferences({super.key, required this.profile});

  @override
  State<ProfileReferences> createState() => _ProfileReferenceState();
}

class _ProfileReferenceState extends State<ProfileReferences> {
  TextStyle style() {
    return const TextStyle(
      fontSize: 12,
      color: Colors.black,
      fontFamily: 'Calibri',
    );
  }
  TextStyle styleLink() {
    return const TextStyle(
      fontSize: 12,
      color: Colors.blue,
      fontFamily: 'Calibri',
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Aqui se muestra las referencias que se tomaron para cada una de las API de la pagina TMDB.',
            style: style(),
            // overflow: TextOverflow.ellipsis,
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
            style: style(),
            overflow: TextOverflow.ellipsis,
          ),
          Text(right,
            style: styleLink(),
            overflow: TextOverflow.ellipsis,
          )
      ],),
    );
  }
}

