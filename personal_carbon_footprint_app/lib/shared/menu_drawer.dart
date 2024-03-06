import 'package:flutter/material.dart';
import 'package:personal_carbon_footprint_app/screens/login_screen.dart';
import 'package:personal_carbon_footprint_app/shared/globals.dart';
import '../screens/carbon_footprint_questions_screen.dart';
import '../screens/intro_screen.dart';
import '../screens/results_screen.dart';

//Class to create the menu drawer which will be available on all pages
class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: buildMenuItems(context)),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    List<String> menuTitles = [
      'Home',
      'Carbon Footprint Calculator',
      'Results',
      'Logout'
    ];

    List<Widget> menuItems = [];
    menuItems.add(DrawerHeader(
        decoration: BoxDecoration(color: Colors.green),
        child: Text('Your Precious World',
            style: TextStyle(color: Colors.white, fontSize: 28))));

    menuTitles.forEach((String element) {
      Widget screen = Container();
      menuItems.add(ListTile(
          title: Text(element, style: TextStyle(fontSize: 18)),
          onTap: () {
            switch (element) {
              case 'Home':
                screen = IntroScreen();
                break;
              case 'Carbon Footprint Calculator':
                screen = CarbonFootprintQuestionsScreen();
                break;
              case 'Results':
                screen = ResultsScreen();
                break;
              case 'Logout':
                isLoggedIn = false;
                loggedInUserId = null;
                screen = LoginScreen();
              break;
            }
            Navigator.of(context).pop();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => screen));
          }));
    });
    return menuItems;
  }
}
