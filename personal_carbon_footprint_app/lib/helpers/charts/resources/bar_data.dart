import 'package:personal_carbon_footprint_app/data/results.dart';
import 'package:personal_carbon_footprint_app/data/sp_helper.dart';
import 'package:personal_carbon_footprint_app/helpers/charts/resources/individual_bar.dart';

class BarData {
  final SPHelper helper = SPHelper();
  List<IndividualBar> barDataTest = [];

  // Initialise bar data
  void intialiseBarData() {
    Results lastResult = helper.getResultsForLoggedInUser().last;

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

    var sortedScores = Map.fromEntries(
    scores.entries.toList()
    ..sort((e1, e2) => e1.value.compareTo(e2.value)));

    barDataTest = [
      IndividualBar(x: 0, y: sortedScores.values.elementAt(11) as double),
      IndividualBar(x: 1, y: sortedScores.values.elementAt(10) as double),
      IndividualBar(x: 2, y: sortedScores.values.elementAt(9) as double),
    ];
  }
}
