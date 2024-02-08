import 'package:personal_carbon_footprint_app/shared/menu_drawer.dart';
import 'package:flutter/material.dart';
import '../shared/menu_bottom.dart';

//Class which contains the intro screen when a user enters the app
class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Your Precious World')),
        drawer: MenuDrawer(),
        bottomNavigationBar: MenuBottom(),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/environment.jpg'),
                  fit: BoxFit.cover)),
          child: Center(
            child: Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white70,
                ),
                child: Text('Protect our world, \n one action at a time',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, shadows: [
                      Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 2.0,
                          color: Colors.grey)
                    
                    ]))),
          ),
        ));
  }
}
