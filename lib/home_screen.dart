import 'package:flutter/material.dart';
import 'package:flutter_final_exam_phan_phanit/navigation/account_nav.dart';
import 'package:flutter_final_exam_phan_phanit/navigation/explore_nav.dart';
import 'package:flutter_final_exam_phan_phanit/navigation/home_nav.dart';
import 'package:flutter_final_exam_phan_phanit/navigation/settings_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;

  final taps = [
    HomeNav(),
    ExploreNav(),
    AccountNav(),
    SettingsNav(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: taps[_currentIndex],
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      selectedFontSize: 16,
      unselectedFontSize: 16,
      iconSize: 28,
      selectedItemColor: Color(0xFF26A250),
      onTap: ((value) {
        setState(() {
          _currentIndex = value;
        });
      }),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Explore",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Account",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Settings",
        ),
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Color(0xFF26A250),
      title: Text(
        "Visit Me",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
