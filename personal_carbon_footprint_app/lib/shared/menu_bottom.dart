import 'package:flutter/material.dart';

//Class which creates the bottom navigation bar on all pages (except 
//registration and login pages)
class MenuBottom extends StatelessWidget {
  const MenuBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
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
             case 3:
              Navigator.pushNamed(context, '/links');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), label: 'Home'), 
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark), label: 'Questions'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded), label: 'Results'),
          BottomNavigationBarItem(  
            icon: Icon(Icons.link), label: 'Links')
        ]);
  }
}