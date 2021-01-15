import 'package:flutter/material.dart';
import './screen/Detailpage_screen.dart';
import './screen/Homepage_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => HomePageScreen(),
        '/detail': (_) => DetailPageScreen(),
      },
    );
  }
}
