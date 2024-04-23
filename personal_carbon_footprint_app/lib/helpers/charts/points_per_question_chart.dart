import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:personal_carbon_footprint_app/data/results.dart';
import 'package:personal_carbon_footprint_app/data/sp_helper.dart';
import 'package:personal_carbon_footprint_app/helpers/charts/resources/chart_colors.dart';
import 'package:personal_carbon_footprint_app/shared/globals.dart';

//This class generates the chart based on points split over the questions
//answered on the carbon footprint questions page
class PointsPerQuestionChart {
  final SPHelper helper = SPHelper();
  final double fontSize = 14;
  
  //Generation of the pie chart results screen entry
  List<PieChartSectionData> chartShowingSections(List<Results> results, touchedIndex) {
    List<Results> results = helper.getResultsForLoggedInUser();
    if (isLoggedIn && results.isNotEmpty) {
      return List.generate(12, (i) {
        final isTouched = i == touchedIndex;
        final fontSize = isTouched ? 25.0 : 16.0;
        final radius = isTouched ? 60.0 : 50.0;
        const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
        switch (i) {
          case 0:
            return PieChartSectionData(
              color: ChartColors.contentColorBlue,
              title: results.last.numberOfPeopleInHomeScore.toStringAsFixed(0),
              value: results.last.numberOfPeopleInHomeScore.toDouble(),
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: ChartColors.mainTextColor,
                shadows: shadows,
              ),
            );
          case 1:
            return PieChartSectionData(
              color: ChartColors.contentColorYellow,
              title: results.last.houseSizeScore.toStringAsFixed(0),
              value: results.last.houseSizeScore.toDouble(),
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: ChartColors.mainTextColor,
                shadows: shadows,
              ),
            );
          case 2:
            return PieChartSectionData(
              color: ChartColors.contentColorPurple,
              title: results.last.foodHabitsScore.toStringAsFixed(0),
              value: results.last.foodHabitsScore.toDouble(),
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: ChartColors.mainTextColor,
                shadows: shadows,
              ),
            );
          case 3:
            return PieChartSectionData(
              color: ChartColors.contentColorLightGreen,
              title: results.last.packagingUseScore.toStringAsFixed(0),
              value: results.last.packagingUseScore.toDouble(),
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: ChartColors.mainTextColor,
                shadows: shadows,
              ),
            );
          case 4:
            return PieChartSectionData(
              color: ChartColors.contentColorBlack,
              title: results.last.washingMachineUsageScore.toStringAsFixed(0),
              value: results.last.washingMachineUsageScore.toDouble(),
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: ChartColors.mainTextColor,
                shadows: shadows,
              ),
            );
          case 5:
            return PieChartSectionData(
              color: ChartColors.contentColorDarkRed,
              title: results.last.wheelieBinsFilledScore.toStringAsFixed(0),
              value: results.last.wheelieBinsFilledScore.toDouble(),
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: ChartColors.mainTextColor,
                shadows: shadows,
              ),
            );
          case 6:
            return PieChartSectionData(
              color: ChartColors.contentColorCyan,
              title: results.last.dishwasherUsageScore.toStringAsFixed(0),
              value: results.last.dishwasherUsageScore.toDouble(),
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: ChartColors.mainTextColor,
                shadows: shadows,
              ),
            );
          case 7:
            return PieChartSectionData(
              color: ChartColors.contentColorPink,
              title: results.last.newHouseholdPurchasesScore.toStringAsFixed(0),
              value: results.last.newHouseholdPurchasesScore.toDouble(),
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: ChartColors.mainTextColor,
                shadows: shadows,
              ),
            );
          case 8:
            return PieChartSectionData(
              color: ChartColors.contentColorOrange,
              title: results.last.personalVehicleMilesScore.toStringAsFixed(0),
              value: results.last.personalVehicleMilesScore.toDouble(),
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: ChartColors.mainTextColor,
                shadows: shadows,
              ),
            );
          case 9:
            return PieChartSectionData(
              color: ChartColors.contentColorDarkBlue,
              title: results.last.publicTransportMilesScore.toStringAsFixed(0),
              value: results.last.publicTransportMilesScore.toDouble(),
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: ChartColors.mainTextColor,
                shadows: shadows,
              ),
            );
          case 10:
            return PieChartSectionData(
              color: ChartColors.contentColorDarkGreen,
              title: results.last.typesOfRecyclingScore.toStringAsFixed(0),
              value: results.last.typesOfRecyclingScore.toDouble(),
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: ChartColors.mainTextColor,
                shadows: shadows,
              ),
            );
          case 11:
            return PieChartSectionData(
              color: ChartColors.contentColorLightRed,
              title: results.last.flightMilesScore.toStringAsFixed(0),
              value: results.last.flightMilesScore.toDouble(),
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: ChartColors.mainTextColor,
                shadows: shadows,
              ),
            );
          default:
            throw Error();
        }
      });
    }
    return <PieChartSectionData>[];
  }
}