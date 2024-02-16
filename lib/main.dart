import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_ducr/features/leading/presentation/page/leading_page.dart';
import 'package:movie_ducr/core/service_locator.dart' as sl;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await sl.init();
  Firebase.initializeApp();
  runApp(const Peliculas());
}

class Peliculas extends StatelessWidget {
  const Peliculas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peliculas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LeadingPage(),
    );
  }
}
