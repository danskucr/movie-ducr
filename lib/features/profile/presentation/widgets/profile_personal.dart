import 'package:flutter/material.dart';
import 'package:movie_ducr/features/profile/data/models/profile_reseponse.dart';

class ProfilePersonal extends StatefulWidget {
  final ProfileResponse profile;
  const ProfilePersonal({super.key, required this.profile});

  @override
  State<ProfilePersonal> createState() => _ProfilePersonalState();
}

class _ProfilePersonalState extends State<ProfilePersonal> {
  TextStyle style() {
    return const TextStyle(
      fontSize: 12,
      color: Colors.black,
      fontFamily: 'Calibri',
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Aqui se muestra la informacion personal respecto a mi usuario.',
            style: style(),
        ),
        rowInfo('Nombre: ', 'Dante Uriel Chávez Rodríguez'),
        rowInfo('Username: ', widget.profile.username),
        rowInfo('ID: ', widget.profile.id.toString()),
        rowInfo('PAIS: ', widget.profile.iso31661)
      ],
    );
  }
  rowInfo(String left, String right){

    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(left,
            style: style(),
            overflow: TextOverflow.ellipsis,
          ),
          Text(right,
            style: style(),
            overflow: TextOverflow.ellipsis,
          )
      ],),
    );
  }
}