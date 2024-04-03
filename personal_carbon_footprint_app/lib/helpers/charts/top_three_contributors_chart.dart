import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:personal_carbon_footprint_app/data/results.dart';
import 'package:personal_carbon_footprint_app/data/sp_helper.dart';
import 'package:personal_carbon_footprint_app/helpers/charts/resources/bar_data.dart';

class TopThreeContributorsChart extends StatelessWidget {
  const TopThreeContributorsChart({super.key});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData();
    myBarData.intialiseBarData();
    return BarChart(BarChartData(
        maxY: 50,
        minY: 0,
        titlesData: const FlTitlesData(
            show: true,
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: getBottomTitles))),
        barGroups: myBarData.barDataTest
            .map((data) => BarChartGroupData(x: data.x, barRods: [
                  BarChartRodData(
                      toY: data.y,
                      width: 20,
                      borderRadius: BorderRadius.circular(4))
                ]))
            .toList()));
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  final SPHelper helper = SPHelper();
  Results lastResult = helper.getResultsForLoggedInUser().last; //NEEDED FOR LABELS
  
   var scores = { 
    'People in home' : lastResult.numberOfPeopleInHomeScore,
    'House size' : lastResult.houseSizeScore,
    'Food habits' : lastResult.foodHabitsScore,
    'Food packaging' : lastResult.packagingUseScore,
    'Washing machine' : lastResult.washingMachineUsageScore,
    'Bins filled' : lastResult.wheelieBinsFilledScore,
    'Dishwasher use' : lastResult.dishwasherUsageScore,
    'Household items' : lastResult.newHouseholdPurchasesScore,
    'Personal vehicle' : lastResult.personalVehicleMilesScore,
    'Public transport' : lastResult.publicTransportMilesScore,
    'Recycling options' : lastResult.typesOfRecyclingScore,
    'Flight miles' : lastResult.flightMilesScore,
    };

  var sortedScores = Map.fromEntries(
    scores.entries.toList()
    ..sort((e1, e2) => e1.value.compareTo(e2.value)));

  const style = TextStyle(fontSize: 12);
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = Text(sortedScores.keys.elementAt(11), style: style);
      break;
    case 1:
      text = Text(sortedScores.keys.elementAt(10), style: style);
      break;
    case 2:
      text = Text(sortedScores.keys.elementAt(9), style: style);
      break;
    default:
      text = const Text('', style: style);
  }

  return SideTitleWidget(axisSide: meta.axisSide, angle: 50, child: text);
}
