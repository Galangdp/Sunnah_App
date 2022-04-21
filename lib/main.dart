import 'package:flutter/material.dart';
import 'package:sunnah_app/main_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile Ustadz Sunnah",
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
