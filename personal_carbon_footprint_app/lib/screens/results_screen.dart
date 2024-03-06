import 'package:flutter/material.dart';
import 'package:personal_carbon_footprint_app/data/results.dart';
import 'package:personal_carbon_footprint_app/data/sp_helper.dart';
import 'package:personal_carbon_footprint_app/shared/globals.dart';
import 'package:personal_carbon_footprint_app/shared/menu_bottom.dart';
import 'package:personal_carbon_footprint_app/shared/menu_drawer.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  final SPHelper helper = SPHelper();
  List<Results> results = [];

  @override
  void initState() {
    helper.init().then((value) {
      updateScreen();
    });
    super.initState();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Precious World'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('yellowSand.jpg'), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(children: [
            //Title for the page
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Text(
                'Your personal results',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            //List of previous results
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  //padding: const EdgeInsets.all(15.0),
                  children: getContent()),
            )
          ]),
        ),
      ),
      bottomNavigationBar: MenuBottom(),
      drawer: MenuDrawer(),
    );
  }

  List<Widget> getContent() {
    List<Widget> tiles = [];
    //Orders the results to add the latest one to the top
    results.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    //If no previous results, show a message
    if (!isLoggedIn) {
      tiles.add(
          ListTile(title: Text('You must login to see your previous results')));
      return tiles;
    } else if (results.isEmpty) {
      tiles.add(ListTile(title: Text('You do not have any previous results')));
      return tiles;
    } else {
      int counter = 0;
      //Loop through each results and add them as list tiles to be displayed
      for (var result in results) {
        if (loggedInUserId == result.userId) {
          tiles.add(Dismissible(
            key: UniqueKey(),
            onDismissed: (_) {
              //Allow deletion of results
              helper.deleteResult(result.id).then((value) => updateScreen());
            },
            child: ListTile(
                onTap: () => existingResultBuilder(context, result),
                title: Text(result.timestamp.toString()),
                subtitle:
                    Text('Score: ${result.score} - Rating: ${result.rating}')),
          ));
          counter++;
          //Only show the latest 10 results
          if (counter == 10) {
            break;
          }
        }
      }
    }
    return tiles;
  }

  void updateScreen() {
    results = helper.getResults();
    setState(() {});
  }

  Future<void> existingResultBuilder(BuildContext context, Results result) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Result'),
          content:
              Text('No. of people in home: ${result.numberOfPeopleInHome}\n'
                  'House size: ${result.houseSize}\n'
                  'Food habits: ${result.foodHabits}\n'
                  'Packaging use: ${result.packagingUse}\n'
                  'Washing machine use: ${result.washingMachineUsage}\n'
                  'Dishwasher use: ${result.dishwasherUsage}\n'
                  'New household purchases: ${result.newHouseholdPurchases}\n'
                  'Wheelie bins filled: ${result.wheelieBinsFilled}\n'
                  'Types of recycling: ${result.typesOfRecycling}\n'
                  'Personal vehicle miles: ${result.personalVehicleMiles}\n'
                  'Public transport use: ${result.publicTransportMiles}\n'
                  'Flight miles: ${result.flightMiles}\n'),
          //Close window button
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
