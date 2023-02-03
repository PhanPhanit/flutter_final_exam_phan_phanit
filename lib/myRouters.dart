import 'package:flutter/material.dart';
import 'package:flutter_final_exam_phan_phanit/home_screen.dart';
import 'package:flutter_final_exam_phan_phanit/models/province.dart';
import 'package:flutter_final_exam_phan_phanit/pages/detail_page.dart';
import 'package:flutter_final_exam_phan_phanit/utils/constants.dart';

class MyRouters {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePagePath:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case detailPagePath:
        var d = settings.arguments as Province;
        return MaterialPageRoute(builder: (context) => DetailPage(province: d));
      default:
    }

    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text("No route defined"),
        ),
      ),
    );
  }
}
