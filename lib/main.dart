import 'package:fixtureapp/view/fixture_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Football League',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:   FixtureScreen(),
    );
  }
}