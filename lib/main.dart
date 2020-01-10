import 'package:flutter/material.dart';
import 'package:rodo_assignment/LandingPage.dart';
import 'package:rodo_assignment/detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
      routes: {DetailScreen.routeName: (context) => DetailScreen()},
    );
  }
}
