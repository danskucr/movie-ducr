import 'package:flutter/material.dart';
import 'package:movie_ducr/features/leading/presentation/page/leading_page.dart';
import 'package:movie_ducr/core/service_locator.dart' as sl;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sl.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LeadingPage(),
    );
  }
}
