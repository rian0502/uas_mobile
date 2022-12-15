import 'package:flutter/material.dart';
import 'package:unila_data/api/api.dart';
import 'package:unila_data/screen/splash_screen.dart';

import 'home.dart';

void main() {
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
      home:  SplashScreen(),
    );
  }
}


