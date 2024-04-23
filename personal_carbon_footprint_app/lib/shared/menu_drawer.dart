import 'package:flutter/material.dart';
import 'package:personal_carbon_footprint_app/screens/links_screen.dart';
import 'package:personal_carbon_footprint_app/screens/login_screen.dart';
import 'package:personal_carbon_footprint_app/shared/globals.dart';
import '../screens/questions_screen.dart';
import '../screens/intro_screen.dart';
import '../screens/results_screen.dart';

//Class to create the menu drawer which will be available on all pages (except
//the login and registration pages)
class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: buildMenuItems(context)),
    );
  }

  //Method to build the menu items in the app
  List<Widget> buildMenuItems(BuildContext context) {
    List<String> menuTitles = [
      'Home',
      'Carbon Footprint Calculator',
      'Results',
      'Links',
      'Logout'
    ];

    List<Widget> menuItems = [];
    menuItems.add(const DrawerHeader(
        decoration: BoxDecoration(color: Colors.green),
        child: Text('Our Precious World',
            style: TextStyle(color: Colors.white, fontSize: 28))));

    for (var element in menuTitles) {
      Widget screen = Container();
      menuItems.add(ListTile(
          title: Text(element, style: const TextStyle(fontSize: 18)),
          onTap: () {
            switch (element) {
              case 'Home':
                screen = const IntroScreen();
                break;
              case 'Carbon Footprint Calculator':
                screen = const CarbonFootprintQuestionsScreen();
                break;
              case 'Results':
                screen = const ResultsScreen();
                break;
              case 'Links':
                screen = const LinksScreen();
                break;
              case 'Logout':
                isLoggedIn = false;
                loggedInUserId = 0;
                screen = const LoginScreen();
                break;
            }
            Navigator.of(context).pop();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => screen));
          }));
    }
    return menuItems;
  }
}
