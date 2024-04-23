import 'package:personal_carbon_footprint_app/screens/links_screen.dart';
import 'package:personal_carbon_footprint_app/screens/questions_screen.dart';
import 'package:personal_carbon_footprint_app/screens/intro_screen.dart';
import 'package:personal_carbon_footprint_app/screens/login_screen.dart';
import 'package:personal_carbon_footprint_app/screens/register_screen.dart';
import 'package:personal_carbon_footprint_app/screens/results_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CarbonFootprintApp());
}

class CarbonFootprintApp extends StatelessWidget {
  const CarbonFootprintApp({super.key});

  //Builds the app and provide the routes which are present in the system
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      routes: {
        '/': (context) => const LoginScreen(),
        '/questions': (context) => const CarbonFootprintQuestionsScreen(),
        '/results' : (context) => const ResultsScreen(),
        '/links' : (context) => const LinksScreen(),
        '/register' : (context) => const RegisterScreen(),
        '/intro' : (context) => const IntroScreen()
      },
      initialRoute: '/',
    );
  }
}
