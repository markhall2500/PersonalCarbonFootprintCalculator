import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:personal_carbon_footprint_app/data/results.dart';
import 'package:personal_carbon_footprint_app/data/sp_helper.dart';
import 'package:personal_carbon_footprint_app/helpers/charts/resources/chart_colors.dart';
import 'package:personal_carbon_footprint_app/shared/globals.dart';

class PercentagesPerQuestionChart {
  final SPHelper helper = SPHelper();
  final double fontSize = 14;

  List<PieChartSectionData> thirdChartShowingSections(List<Results> results, touchedIndex) {
    if (isLoggedIn && results.isNotEmpty) {
      Results result = helper.getResultsForLoggedInUser().last;

      //The below ensures that count total 100% is displayed to the user
      //Calculating the total from all of the score of the form fields
      int carbonFootprintTotalScore = result.numberOfPeopleInHomeScore +
          result.houseSizeScore +
          result.foodHabitsScore +
          result.packagingUseScore +
          result.washingMachineUsageScore +
          result.dishwasherUsageScore +
          result.newHouseholdPurchasesScore +
          result.wheelieBinsFilledScore +
          result.personalVehicleMilesScore +
          result.publicTransportMilesScore +
          result.flightMilesScore +
          result.typesOfRecyclingScore;

      //Percentage values for each field from the scores
      double numberOfPeopleInHomePercent =
          ((result.numberOfPeopleInHomeScore / carbonFootprintTotalScore) *
              100);
      double houseSizePercent =
          ((result.houseSizeScore / carbonFootprintTotalScore) * 100);
      double foodHabitsPercent =
          ((result.foodHabitsScore / carbonFootprintTotalScore) * 100);
      double packagingUsePercent =
          ((result.foodHabitsScore / carbonFootprintTotalScore) * 100);
      double washingMachinePercent =
          ((result.washingMachineUsageScore / carbonFootprintTotalScore) * 100);
      double dishwasherPercent =
          ((result.dishwasherUsageScore / carbonFootprintTotalScore) * 100);
      double newHouseholdPurchasesPercent =
          ((result.newHouseholdPurchasesScore / carbonFootprintTotalScore) *
              100);
      double wheelieBinsPercent =
          ((result.wheelieBinsFilledScore / carbonFootprintTotalScore) * 100);
      double personalVehicleMilesPercent =
          ((result.personalVehicleMilesScore / carbonFootprintTotalScore) *
              100);
      double publicTransportMilesPercent =
          ((result.publicTransportMilesScore / carbonFootprintTotalScore) *
              100);
      double flightMilesPercent =
          ((result.flightMilesScore / carbonFootprintTotalScore) * 100);
      double typesOfRecyclingPercent =
          ((result.typesOfRecyclingScore / carbonFootprintTotalScore) * 100);

      //Take the remainders, incase the total percentage of all scores is below 100%
      double numberOfPeopleInHomeRemainder =
          numberOfPeopleInHomePercent - numberOfPeopleInHomePercent.toInt();
      double houseSizeRemainder = houseSizePercent - houseSizePercent.toInt();
      double foodHabitsRemainder =
          foodHabitsPercent - foodHabitsPercent.toInt();
      double packagingUseRemainder =
          packagingUsePercent - packagingUsePercent.toInt();
      double washingMachineRemainder =
          washingMachinePercent - washingMachinePercent.toInt();
      double dishwasherRemainder =
          dishwasherPercent - dishwasherPercent.toInt();
      double newHouseholdPurchasesRemainder =
          newHouseholdPurchasesPercent - newHouseholdPurchasesPercent.toInt();
      double wheelieBinsRemainder =
          wheelieBinsPercent - wheelieBinsPercent.toInt();
      double personalVehicleMilesRemainder =
          personalVehicleMilesPercent - personalVehicleMilesPercent.toInt();
      double publicTransportMilesRemainder =
          publicTransportMilesPercent - publicTransportMilesPercent.toInt();
      double flightMilesRemainder =
          flightMilesPercent - flightMilesPercent.toInt();
      double typesOfRecyclingRemainder =
          typesOfRecyclingPercent - typesOfRecyclingPercent.toInt();

      //Update the Percentage value to remove the remainder (rounded down)
      numberOfPeopleInHomePercent =
          double.parse((numberOfPeopleInHomePercent).toStringAsFixed(0));
      houseSizePercent = double.parse((houseSizePercent).toStringAsFixed(0));
      foodHabitsPercent = double.parse((foodHabitsPercent).toStringAsFixed(0));
      packagingUsePercent =
          double.parse((packagingUsePercent).toStringAsFixed(0));
      washingMachinePercent =
          double.parse((washingMachinePercent).toStringAsFixed(0));
      dishwasherPercent = double.parse((dishwasherPercent).toStringAsFixed(0));
      newHouseholdPurchasesPercent =
          double.parse((newHouseholdPurchasesPercent).toStringAsFixed(0));
      wheelieBinsPercent =
          double.parse((wheelieBinsPercent).toStringAsFixed(0));
      personalVehicleMilesPercent =
          double.parse((personalVehicleMilesPercent).toStringAsFixed(0));
      publicTransportMilesPercent =
          double.parse((publicTransportMilesPercent).toStringAsFixed(0));
      flightMilesPercent =
          double.parse((flightMilesPercent).toStringAsFixed(0));
      typesOfRecyclingPercent =
          double.parse((typesOfRecyclingPercent).toStringAsFixed(0));

      //Variable for check if total percentages equal 100% for the chart
      double totalPercentage = numberOfPeopleInHomePercent +
          houseSizePercent +
          foodHabitsPercent +
          packagingUsePercent +
          washingMachinePercent +
          dishwasherPercent +
          newHouseholdPurchasesPercent +
          wheelieBinsPercent +
          personalVehicleMilesPercent +
          publicTransportMilesPercent +
          flightMilesPercent +
          typesOfRecyclingPercent;

      //Set of remainders for if the total percentage does not equal 100%
      var remainders = {
        'People in home': numberOfPeopleInHomeRemainder,
        'House size': houseSizeRemainder,
        'Food habits': foodHabitsRemainder,
        'Food packaging use': packagingUseRemainder,
        'Washing machine use': washingMachineRemainder,
        'Wheelie bins filled': wheelieBinsRemainder,
        'Dishwasher use': dishwasherRemainder,
        'New household items': newHouseholdPurchasesRemainder,
        'Personal vehicle use': personalVehicleMilesRemainder,
        'Public transport use': publicTransportMilesRemainder,
        'Recycling options': typesOfRecyclingRemainder,
        'Flight miles': flightMilesRemainder,
      };

      //Increment the highest remainder score if the total score is less than 100%
      while (totalPercentage.toInt() < 100) {
        //Sort remainders in a map and sort it
        var sortedRemainders = Map.fromEntries(remainders.entries.toList()
          ..sort((e1, e2) => e1.value.compareTo(e2.value)));

        //Calculate which remainder is highest and increment that field percent by 1
        switch (sortedRemainders.keys.first) {
          case 'People in home':
            numberOfPeopleInHomePercent++;
            break;
          case 'House size':
            houseSizePercent++;
            break;
          case 'Food habits':
            foodHabitsPercent++;
            break;
          case 'Food packaging use':
            packagingUsePercent++;
            break;
          case 'Washing machine use':
            washingMachinePercent++;
            break;
          case 'Wheelie bins filled':
            wheelieBinsPercent++;
            break;
          case 'Dishwasher use':
            dishwasherPercent++;
            break;
          case 'New household items':
            newHouseholdPurchasesPercent++;
            break;
          case 'Personal vehicle use':
            personalVehicleMilesPercent++;
            break;
          case 'Public transport use':
            publicTransportMilesPercent++;
            break;
          case 'Recycling options':
            typesOfRecyclingPercent++;
            break;
          case 'Flight miles':
            flightMilesPercent++;
            break;
          default:
            break;
        }

        //Remove that score from the list incase a repeat is required
        remainders.remove(sortedRemainders.entries.first);

        //Increment totalPercentage variable by 1
        totalPercentage++;
      }

      //NOT NEEDED ANYMORE - HERE FOR REFERENCE AND CAN BE DELETED
      //double houseSizePercent = double.parse(
      //  ((result.houseSizeScore / carbonFootprintTotalScore) * 100)
      //    .toStringAsFixed(0));

      //Generation of the results screen
      return List.generate(12, (i) {
        final isTouched = i == touchedIndex;
        final fontSize = isTouched ? 25.0 : 16.0;
        final radius = isTouched ? 60.0 : 50.0;
        const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
        switch (i) {
          case 0:
            return PieChartSectionData(
              color: ChartColors.contentColorBlue,
              value: numberOfPeopleInHomePercent,
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
              value: houseSizePercent,
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
              value: foodHabitsPercent,
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
              value: packagingUsePercent,
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
              value: washingMachinePercent,
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
              value: wheelieBinsPercent,
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
              value: dishwasherPercent,
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
              value: newHouseholdPurchasesPercent,
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
              value: personalVehicleMilesPercent,
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
              value: publicTransportMilesPercent,
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
              value: typesOfRecyclingPercent,
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
              value: flightMilesPercent,
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