import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:um_qais/constant/colors.dart';
import 'package:um_qais/screen/home/gallery.dart';
import 'package:um_qais/screen/home/home_screen.dart';
import 'package:um_qais/widget/question_page%20.dart';

class ControllerBottomNav extends StatefulWidget {
  @override
  _ControllerBottomNavState createState() => _ControllerBottomNavState();
}

class _ControllerBottomNavState extends State<ControllerBottomNav> {
  int _selectedIndex = 0;

  // Pages to be displayed
  final List<Widget> _pages = [
    const HomePage(),
    const GalleryPage(),
    QuestionPage(),
   
  ];

  // Function to change the selected index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _pages[_selectedIndex],
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: MainColor,
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Gallery',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.question_mark_rounded),
            label: 'Information',
          ),
        ],
      ),
    );
  }
}






