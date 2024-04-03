import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:personal_carbon_footprint_app/data/results.dart';
import 'package:personal_carbon_footprint_app/data/sp_helper.dart';
import 'package:personal_carbon_footprint_app/helpers/charts/resources/chart_colors.dart';
import 'package:personal_carbon_footprint_app/shared/globals.dart';

class PointsPerQuestionChart {
  final SPHelper helper = SPHelper();
  final double fontSize = 14;
  
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
              value: results.last.numberOfPeopleInHomeScore as double,
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
              value: results.last.houseSizeScore as double,
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
              value: results.last.foodHabitsScore as double,
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
              value: results.last.packagingUseScore as double,
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
              value: results.last.washingMachineUsageScore as double,
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
              value: results.last.wheelieBinsFilledScore as double,
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
              value: results.last.dishwasherUsageScore as double,
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
              value: results.last.newHouseholdPurchasesScore as double,
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
              value: results.last.personalVehicleMilesScore as double,
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
              value: results.last.publicTransportMilesScore as double,
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
              value: results.last.typesOfRecyclingScore as double,
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
              value: results.last.flightMilesScore as double,
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