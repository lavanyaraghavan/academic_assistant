import 'package:academic_assistant/Marks/Marks4.dart';
import 'package:flutter/material.dart';
import 'package:academic_assistant/todo_main.dart';
import 'package:academic_assistant/Attendance/Attendance4.dart';


class SubjectPage4 extends StatefulWidget {
  @override
  _MyBottomBarDemoState createState() => new _MyBottomBarDemoState();
}

class _MyBottomBarDemoState extends State<SubjectPage4> {
  int _pageIndex = 0;
  PageController _pageController;

  List<Widget> tabPages = [
    TextFieldNumeric4(),
    Attendance4(),
    //Home(),
  ];

  @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.purple[800],
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem( icon: Icon(Icons.lightbulb), title: Text("Marks")),
          BottomNavigationBarItem(icon: Icon(Icons.notes), title: Text("Attendance")),
          //BottomNavigationBarItem(icon: Icon(Icons.assignment_outlined), title: Text("To-do")),
        ],

      ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }
  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
  }
}