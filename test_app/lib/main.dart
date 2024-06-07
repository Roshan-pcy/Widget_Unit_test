import 'package:flutter/material.dart';
import 'package:test_app/HomeScreen.dart';
import 'package:test_app/NewHome.dart';
import 'package:test_app/animation.dart';
import 'package:test_app/counter.dart';
import 'package:test_app/userrepo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AnimationWidget());
  }
}
