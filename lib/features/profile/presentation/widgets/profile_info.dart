import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ducr/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:movie_ducr/features/profile/presentation/bloc/profile/profile_state.dart';
import 'package:movie_ducr/features/profile/presentation/widgets/profile_personal.dart';
import 'package:movie_ducr/features/profile/presentation/widgets/profile_references.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  TextStyle styleTitle() {
    return const TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontFamily: 'Calibri',
      fontWeight: FontWeight.w500
    );
  }
  TextStyle styleText() {
    return const TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontFamily: 'Calibri',
      fontWeight: FontWeight.normal
    );
  }
  List<Step> getSteps() {
    return [
      Step('0'),
      Step('1'),
    ];
  }
  @override
  Widget build(BuildContext context) {
    final List<Step> _steps = getSteps();

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state){
        if (state is ProfileLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }else if (state is ProfileLoaded){
          return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                rowImage(state.profile.username),
                ExpansionPanelList.radio(
                  expandIconColor: Colors.deepPurpleAccent,
                  expandedHeaderPadding: EdgeInsets.only(left: 10, right: 10),
                  elevation: 0,
                  children: _steps.map<ExpansionPanelRadio>((Step step) {
                    return ExpansionPanelRadio(
                      canTapOnHeader: true,
                      backgroundColor: Colors.deepPurple.shade100,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          contentPadding: EdgeInsets.only(left: 10),
                          title: step.title == '0' ? 
                          Text('Perfil',
                            style: styleTitle(),
                              overflow: TextOverflow.ellipsis,
                          ) : Text('Referencias',
                              style: styleTitle(),
                              overflow: TextOverflow.ellipsis,
                          )
                        );
                      },
                      body: ListTile(
                        contentPadding: EdgeInsets.all(25),
                        title: 
                        step.title == '0' ? ProfilePersonal(profile: state.profile) : ProfileReferences(profile: state.profile),
                      ),
                      value: step.title
                    );
                  }).toList(),
                ),

            ],);
        }else{
          return Text("Error al consultar Perfil");
        }
      }
    );
  }
  rowImage(String right){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const CircleAvatar(
          radius: 80, // Image radius
          backgroundImage: NetworkImage('https://cdn2.actitudfem.com/media/files/styles/big_img/public/images/2019/08/de-donde-salio-el-meme-del-gato-en-la-mesa-portada.jpg'),
        ),
          Text(right,
            style: styleText(),
            overflow: TextOverflow.ellipsis,
          ),
    ],);
  }

}

class Step {
  Step(
    this.title,
    [this.isExpanded = false]
  );
  String title;
  bool isExpanded;
}
