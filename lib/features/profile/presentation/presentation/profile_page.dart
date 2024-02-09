import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ducr/core/service_locator.dart';
import 'package:movie_ducr/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:movie_ducr/features/profile/presentation/widgets/profile_info.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (_) => sl<ProfileBloc>()..getProfile(),
      child: ProfileInfo()
    );
  }
}