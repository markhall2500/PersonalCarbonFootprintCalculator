import 'package:personal_carbon_footprint_app/screens/carbon_footprint_questions_screen.dart';
import 'package:personal_carbon_footprint_app/screens/intro_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CarbonFootprintApp());
}

class CarbonFootprintApp extends StatelessWidget {
  const CarbonFootprintApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      routes: {
        '/': (context) => IntroScreen(),
        '/questions': (context) => CarbonFootprintQuestionsScreen(),
      },
      initialRoute: '/',
    );
  }
}
