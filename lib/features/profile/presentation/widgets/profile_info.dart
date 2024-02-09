import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ducr/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:movie_ducr/features/profile/presentation/bloc/profile/profile_state.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state){
        if (state is ProfileLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }else if (state is ProfileLoaded){
          return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                rowImage(state.profile.name),
                rowInfor('Username: ', state.profile.username),
                rowInfor('ID: ', state.profile.id.toString()),
                rowInfor('PAIS: ', state.profile.iso31661)
            ],);
        }else{
          return Center(
            child: Text("Error al consultar Perfil")
          );
        }
      }
    );
  }
  rowImage(String right){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const CircleAvatar(
          radius: 48, // Image radius
          backgroundImage: NetworkImage('https://cdn2.actitudfem.com/media/files/styles/big_img/public/images/2019/08/de-donde-salio-el-meme-del-gato-en-la-mesa-portada.jpg'),
        ),
        Text(right)
    ],);
  }
  rowInfor(String left, String right){
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(left),
          Text(right)
      ],),
    );
  }
}