import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../screens/about_screen.dart';
import '../screens/all_stoic_screen.dart';
import '../screens/today_stoic_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = [
    TodayStoicScreen(),
    AllStoicScreen(),
    AboutScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Today Stoic",
            backgroundColor: Color(containerBackgroundColor),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_turned_in_sharp),
            label: "All Stoic",
            backgroundColor: Color(containerBackgroundColor),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "Tentang Kami",
            backgroundColor: Color(containerBackgroundColor),
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: unselectedItemColor,
        backgroundColor: const Color(containerBackgroundColor),
      ),
    );
  }
}
