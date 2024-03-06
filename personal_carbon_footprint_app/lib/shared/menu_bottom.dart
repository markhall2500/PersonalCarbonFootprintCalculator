import 'package:flutter/material.dart';

//Class which creates the bottom navigation bar on all pages
class MenuBottom extends StatelessWidget {
  const MenuBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/intro');
              break;
            case 1:
              Navigator.pushNamed(context, '/questions');
              break;
            case 2:
              Navigator.pushNamed(context, '/results');
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark), label: 'Questions'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded), label: 'Results')
        ]);
  }
}