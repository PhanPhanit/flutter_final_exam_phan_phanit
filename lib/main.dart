import 'package:flutter/material.dart';
import 'package:flutter_final_exam_phan_phanit/home_screen.dart';
import 'package:flutter_final_exam_phan_phanit/myRouters.dart';
import 'package:flutter_final_exam_phan_phanit/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Visit Me',
      onGenerateRoute: MyRouters.generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: homePagePath,
    );
  }
}
