import 'package:personal_carbon_footprint_app/data/results.dart';
import 'package:personal_carbon_footprint_app/data/sp_helper.dart';
import 'package:personal_carbon_footprint_app/helpers/charts/resources/individual_bar.dart';

//This class generates the data to be used on the top 3 contributors bar chart
//on the results page
class BarData {
  final SPHelper helper = SPHelper();
  List<IndividualBar> barDataTest = [];

  // Initialise bar data
  void intialiseBarData() {
    Results lastResult = helper.getResultsForLoggedInUser().last;

    //A collection of the question scores for the last result
    var scores = { 
    'People in home' : lastResult.numberOfPeopleInHomeScore,
    'House size' : lastResult.houseSizeScore,
    'Food habits' : lastResult.foodHabitsScore,
    'Food packaging use' : lastResult.packagingUseScore,
    'Washing machine use' : lastResult.washingMachineUsageScore,
    'Wheelie bins filled' : lastResult.wheelieBinsFilledScore,
    'Dishwasher use' : lastResult.dishwasherUsageScore,
    'New household items' : lastResult.newHouseholdPurchasesScore,
    'Personal vehicle use' : lastResult.personalVehicleMilesScore,
    'Public transport use' : lastResult.publicTransportMilesScore,
    'Recycling options' : lastResult.typesOfRecyclingScore,
    'Flight miles' : lastResult.flightMilesScore,
    };

    //Sort the scores in order
    var sortedScores = Map.fromEntries(
    scores.entries.toList()
    ..sort((e1, e2) => e1.value.compareTo(e2.value)));

    //Create a list to present the top 3 contributors
    barDataTest = [
      IndividualBar(x: 0, y: sortedScores.values.elementAt(11).toDouble()),
      IndividualBar(x: 1, y: sortedScores.values.elementAt(10).toDouble()),
      IndividualBar(x: 2, y: sortedScores.values.elementAt(9).toDouble()),
    ];
  }
}
