import 'dart:math';
import 'package:flutter/material.dart';
import 'package:personal_carbon_footprint_app/screens/questions_screen.dart';
import 'package:personal_carbon_footprint_app/shared/globals.dart';
import 'package:personal_carbon_footprint_app/shared/menu_drawer.dart';
import '../shared/menu_bottom.dart';

//This class builds the intro screen in the app
class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Our Precious World')),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/environment.jpg'),
                fit: BoxFit.cover)),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white70,
                    ),
                    child: introScreenMessage()),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
                onPressed: () {
                  // Directs to the Questions page
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const CarbonFootprintQuestionsScreen()));
                },
                child: Text('Calculate your footprint',
                    style: TextStyle(
                        fontSize: 24, shadows: [globalShadowText()]))),
          ),
        ]),
      ),
    );
  }

  //Method to return a random inspirational message to the user when they access the intro page
  Text introScreenMessage() {
    Text textToReturn = const Text('');
    var randomNumber = Random().nextInt(10);

    switch (randomNumber) {
      case 0:
        textToReturn = Text(
            'We have a single mission: to protect and hand on the planet to the next generation.\n - François Hollande',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, shadows: [globalShadowText()]));
        break;
      case 1:
        textToReturn = Text(
            'The world will not be destroyed by those who do evil, but by those who watch them without doing anything.\n -Albert Einstein',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, shadows: [globalShadowText()]));
        break;
      case 2:
        textToReturn = Text(
            'I play fictitious characters often solving fictitious problems. I believe mankind has looked at climate change in the same way, as if it were fiction.\n -Leonardo DiCaprio',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, shadows: [globalShadowText()]));
        break;
      case 3:
        textToReturn = Text(
            'While the problem can sometimes seem overwhelming, we can turn things around — but we must move beyond climate talk to climate action.\n -Ted Turner',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, shadows: [globalShadowText()]));
        break;
      case 4:
        textToReturn = Text(
            'The environment is where we all meet; where all of us have a mutual interest; it is the one thing all of us share.\n -Lady Bird Johnson',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, shadows: [globalShadowText()]));
        break;
      case 5:
        textToReturn = Text(
            'All things share the same breath — the beast, the tree, the man. The air shares its spirit with all the life it supports.\n -Chief Seattle',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, shadows: [globalShadowText()]));
        break;
      case 6:
        textToReturn = Text(
            'I am often asked whether I believe in global warming. I now just reply with the question: Do you believe in gravity?\n -Neil deGrasse Tyson',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, shadows: [globalShadowText()]));
        break;
      case 7:
        textToReturn = Text(
            'There is no question that climate change is happening; the only arguable point is what part humans are playing in it.\n David Attenborough',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, shadows: [globalShadowText()]));
        break;
      case 8:
        textToReturn = Text(
            'The Earth is a fine place and worth fighting for.\n -Ernest Hemingway',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, shadows: [globalShadowText()]));
        break;
      case 9:
        textToReturn = Text(
            'We do not inherit the earth from our ancestors, we borrow it from our children.\n - Native American Proverb',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, shadows: [globalShadowText()]));
        break;
      default:
        textToReturn = const Text('');
    }

    return textToReturn;
  }
}
