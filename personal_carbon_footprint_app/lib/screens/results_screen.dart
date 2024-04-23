import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:personal_carbon_footprint_app/data/results.dart';
import 'package:personal_carbon_footprint_app/data/sp_helper.dart';
import 'package:personal_carbon_footprint_app/helpers/charts/percentages_per_question_chart.dart';
import 'package:personal_carbon_footprint_app/helpers/charts/points_per_question_chart.dart';
import 'package:personal_carbon_footprint_app/helpers/custom_visibility.dart';
import 'package:personal_carbon_footprint_app/shared/globals.dart';
import 'package:personal_carbon_footprint_app/shared/menu_bottom.dart';
import 'package:personal_carbon_footprint_app/shared/menu_drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../helpers/charts/top_three_contributors_chart.dart';
import '../helpers/charts/indicator.dart';
import '../helpers/charts/ten_previous_results_graph.dart';
import '../helpers/charts/resources/chart_colors.dart';

//This class generates the screen which contains the results from the users
//previous completions of the carbon footprint question results
class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  final SPHelper helper = SPHelper();
  final double fontSize = 14;
  List<Results> results = [];
  int touchedIndex = -1;

  @override
  void initState() {
    helper.init().then((value) {
      updateScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Precious World'),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/yellowSand.jpg'), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(children: [
            //Title for the page
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Text(
                'Your personal results',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    shadows: [globalShadowText()]),
              ),
            ),
            //CO2 emissions value for latest result
            CustomVisibility(
              conditions: [isLoggedIn ? true : false, results.isNotEmpty],
              child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: latestCarbonEmissionsScore()),
            ),
            //Chart 1 - Rating calculated in points text
            CustomVisibility(
              conditions: [isLoggedIn ? true : false, results.isNotEmpty],
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 34.0, left: 32.0, right: 32.0, bottom: 2.0),
                child: Text(
                  'How is your latest rating calculated in points',
                  style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      shadows: [globalShadowText()]),
                ),
              ),
            ),
            //Chart 1 - Rating calculated in points
            CustomVisibility(
              conditions: [isLoggedIn ? true : false, results.isNotEmpty],
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 28.0, left: 8.0, right: 8.0, bottom: 28.0),
                child: AspectRatio(
                  aspectRatio: 1.3,
                  child: Row(
                    children: <Widget>[
                      const SizedBox(
                        height: 18,
                      ),
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: PieChart(
                            PieChartData(
                              pieTouchData: PieTouchData(
                                touchCallback:
                                    (FlTouchEvent event, pieTouchResponse) {
                                  setState(() {
                                    if (!event.isInterestedForInteractions ||
                                        pieTouchResponse == null ||
                                        pieTouchResponse.touchedSection ==
                                            null) {
                                      touchedIndex = -1;
                                      return;
                                    }
                                    touchedIndex = pieTouchResponse
                                        .touchedSection!.touchedSectionIndex;
                                  });
                                },
                              ),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              sectionsSpace: 0,
                              centerSpaceRadius: 40,
                              sections: PointsPerQuestionChart()
                                  .chartShowingSections(results, touchedIndex),
                            ),
                          ),
                        ),
                      ),
                      const SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Indicator(
                              color: ChartColors.contentColorBlue,
                              text: 'People in home',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Indicator(
                              color: ChartColors.contentColorYellow,
                              text: 'House size',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Indicator(
                              color: ChartColors.contentColorPurple,
                              text: 'Food habits',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Indicator(
                              color: ChartColors.contentColorLightGreen,
                              text: 'Food packaging',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Indicator(
                              color: ChartColors.contentColorBlack,
                              text: 'Washing machine',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Indicator(
                              color: ChartColors.contentColorDarkRed,
                              text: 'Bins filled',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Indicator(
                              color: ChartColors.contentColorCyan,
                              text: 'Dishwasher use',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Indicator(
                              color: ChartColors.contentColorPink,
                              text: 'New purchases',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Indicator(
                              color: ChartColors.contentColorOrange,
                              text: 'Personal miles',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Indicator(
                              color: ChartColors.contentColorDarkBlue,
                              text: 'Public miles',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Indicator(
                              color: ChartColors.contentColorDarkGreen,
                              text: 'Recycling',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Indicator(
                              color: ChartColors.contentColorLightRed,
                              text: 'Flight miles',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 18,
                            ),
                          ],
                        ),
                      ),
                       const SizedBox(
                        width: 28,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //Chart 2 - Top 3 points contributors text
            CustomVisibility(
              conditions: [isLoggedIn ? true : false, results.isNotEmpty],
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 28.0, left: 32.0, right: 32.0, bottom: 2.0),
                child: Text(
                  'What are the top 3 contributors to the score',
                  style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      shadows: [globalShadowText()]),
                ),
              ),
            ),
            //Chart 2 - Top 3 points contributors
            CustomVisibility(
              conditions: [isLoggedIn ? true : false, results.isNotEmpty],
              child: const Padding(
                  padding: EdgeInsets.all(28.0),
                  child: SizedBox(
                    height: 200,
                    child: TopThreeContributorsChart(),
                  )),
            ),
            //Chart 3 - Rating calculated in percentage text
            CustomVisibility(
              conditions: [isLoggedIn ? true : false, results.isNotEmpty],
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 42.0, left: 32.0, right: 32.0, bottom: 2.0),
                child: Text(
                  'How is your latest rating calculated in percentages',
                  style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      shadows: [globalShadowText()]),
                ),
              ),
            ),
            //Chart 3 - Rating calculated in percentage
            CustomVisibility(
              conditions: [isLoggedIn ? true : false, results.isNotEmpty],
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 28.0, left: 8.0, right: 8.0, bottom: 28.0),
                child: AspectRatio(
                  aspectRatio: 1.3,
                  child: Row(
                    children: <Widget>[
                      const SizedBox(
                        height: 18,
                      ),
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: PieChart(
                            PieChartData(
                              pieTouchData: PieTouchData(
                                touchCallback:
                                    (FlTouchEvent event, pieTouchResponse) {
                                  setState(() {
                                    if (!event.isInterestedForInteractions ||
                                        pieTouchResponse == null ||
                                        pieTouchResponse.touchedSection ==
                                            null) {
                                      touchedIndex = -1;
                                      return;
                                    }
                                    touchedIndex = pieTouchResponse
                                        .touchedSection!.touchedSectionIndex;
                                  });
                                },
                              ),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              sectionsSpace: 0,
                              centerSpaceRadius: 40,
                              sections: PercentagesPerQuestionChart()
                                  .percentagesPerQuestionChartShowingSections(
                                      results, touchedIndex),
                            ),
                          ),
                        ),
                      ),
                      const SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Indicator(
                              color: ChartColors.contentColorBlue,
                              text: 'People in home',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Indicator(
                              color: ChartColors.contentColorYellow,
                              text: 'House size',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Indicator(
                              color: ChartColors.contentColorPurple,
                              text: 'Food habits',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Indicator(
                              color: ChartColors.contentColorLightGreen,
                              text: 'Food packaging',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Indicator(
                              color: ChartColors.contentColorBlack,
                              text: 'Washing machine',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Indicator(
                              color: ChartColors.contentColorDarkRed,
                              text: 'Bins filled',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Indicator(
                              color: ChartColors.contentColorCyan,
                              text: 'Dishwasher use',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Indicator(
                              color: ChartColors.contentColorPink,
                              text: 'New purchases',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Indicator(
                              color: ChartColors.contentColorOrange,
                              text: 'Personal miles',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Indicator(
                              color: ChartColors.contentColorDarkBlue,
                              text: 'Public miles',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Indicator(
                              color: ChartColors.contentColorDarkGreen,
                              text: 'Recycling',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Indicator(
                              color: ChartColors.contentColorLightRed,
                              text: 'Flight miles',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 18,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 28,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //Chart 4 - Last 10 results (total points) text
            CustomVisibility(
              conditions: [isLoggedIn ? true : false, results.isNotEmpty],
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 28.0, left: 32.0, right: 32.0, bottom: 2.0),
                child: Text(
                  'Your total score over the last 10 completed results',
                  style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      shadows: [globalShadowText()]),
                ),
              ),
            ),
            //Chart 4 - Last 10 results (total points)
            CustomVisibility(
              conditions: [isLoggedIn ? true : false, results.isNotEmpty],
              child: const Padding(
                  padding: EdgeInsets.only(
                    top: 28.0, left: 25.0, right: 30.0, bottom: 28.0),
                  child: SizedBox(
                    child: TenPreviousResultsGraph(),
                  )),
            ),
            //List of last 10 previous results text
            CustomVisibility(
              conditions: [isLoggedIn ? true : false, results.isNotEmpty],
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 28.0, left: 32.0, right: 32.0, bottom: 2.0),
                child: Text(
                  'Your last 10 previous results',
                  style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      shadows: [globalShadowText()]),
                ),
              ),
            ),
            //List of last 10 previous results
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: getContent()),
            ),
            //Suggest a new question text header
            Padding(
              padding: const EdgeInsets.only(
                  top: 30.0, left: 32.0, right: 32.0, bottom: 2.0),
              child: Text('Want to add a new question to our question set?',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize,
                      shadows: [globalShadowText()])),
            ),
            //Suggest a new question text
            Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, left: 32.0, right: 32.0, bottom: 2.0),
              child: Text('Why not send us an email via the link below',
                  style: TextStyle(
                      fontSize: fontSize, shadows: [globalShadowText()])),
            ),
            //Suggest a new question link
            Padding(
              padding: const EdgeInsets.only(
                  top: 18.0, left: 32.0, right: 32.0, bottom: 60.0),
              child: ElevatedButton(
                  onPressed: () {
                    suggestQuestionViaEmail();
                  },
                  child: Text('Suggest a question',
                      style: TextStyle(
                          fontSize: fontSize, shadows: [globalShadowText()]))),
            ),
            //CO2 emissions disclaimer
            CustomVisibility(
              conditions: [isLoggedIn ? true : false, results.isNotEmpty],
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 35.0, left: 32.0, right: 32.0, bottom: 50.0),
                child: Text(
                  '*Your CO2 emissions result is an estimate only. It is based on answered questions only (except number of people in the home and house size), averages and publicly available data',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      shadows: [globalShadowText()]),
                ),
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: const MenuBottom(),
      drawer: const MenuDrawer(),
    );
  }

  List<Widget> getContent() {
    List<Widget> tiles = [];
    //Orders the results to add the latest one to the top
    results.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    if (!isLoggedIn) {
      tiles.add(ListTile(
          title: Text('You must login to see your previous results',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  shadows: [globalShadowText()]))));
      return tiles;
      //If no previous results, show a message
    } else if (results.isEmpty) {
      tiles.add(ListTile(
            title: Text('You do not have any previous results',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  shadows: [globalShadowText()]
            ),)));
      return tiles;
    } else {
      int counter = 0;
      //Loop through each result and add them as list tiles to be displayed for the logged in user
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
    results = helper.getResultsForLoggedInUser();
    setState(() {});
  }

  Future<void> existingResultBuilder(BuildContext context, Results result) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Result'),
          content: Text('Completion date: ${result.timestamp}\n'
              'Score: ${result.score}\n'
              'Rating: ${result.rating}\n'
              'No. of people in home: ${result.numberOfPeopleInHome}\n'
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

  void suggestQuestionViaEmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'ourpreciousworldapp@outlook.com',
      query: 'subject=Our Precious World - New question suggestion!',
    );

    Uri url = params;
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  Text latestCarbonEmissionsScore() {
    if (isLoggedIn && results.isNotEmpty) {
      return Text(
        'Your estimated CO2 emissions per week is ${results.last.carbonEmissionsScore.toStringAsFixed(2)}kg*',
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            shadows: [globalShadowText()]),
      );
    }

    return Text(
      'Your estimated CO2 emissions per week is 0.0',
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          shadows: [globalShadowText()]),
    );
  }
}
