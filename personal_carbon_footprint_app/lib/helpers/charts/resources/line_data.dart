import 'package:personal_carbon_footprint_app/data/results.dart';
import 'package:personal_carbon_footprint_app/data/sp_helper.dart';
import 'package:personal_carbon_footprint_app/helpers/charts/resources/line_point.dart';

//This class stores the model for the line data to generate the last 10
//results entries on the line graph
class LineData {
  final SPHelper helper = SPHelper();
  List<IndividualLine> lineDataTest = [];

  // Initialise line data
  List<IndividualLine> intialiseLineData() {
    List<Results> results = helper.getResultsForLoggedInUser();

    //Sort by Id descending to get the latest 10 results
    results.sort((b, a) => a.id.compareTo(b.id));
    results.reversed;

    //Variable to be used in the line chart for the 10 entries
    List<double> graphEntries = [
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0
    ];

    for (var i = 0; i < results.length; i++) {
      if (i > 9) {
        break;
      }
      var totalScore = results[i].numberOfPeopleInHomeScore +
          results[i].houseSizeScore +
          results[i].foodHabitsScore +
          results[i].packagingUseScore +
          results[i].washingMachineUsageScore +
          results[i].wheelieBinsFilledScore +
          results[i].dishwasherUsageScore +
          results[i].newHouseholdPurchasesScore +
          results[i].personalVehicleMilesScore +
          results[i].publicTransportMilesScore +
          results[i].typesOfRecyclingScore +
          results[i].flightMilesScore;

      graphEntries[i] = totalScore.toDouble();
    }

    return lineDataTest = [
      IndividualLine(x: 0, y: graphEntries[0]),
      IndividualLine(x: 1, y: graphEntries[1]),
      IndividualLine(x: 2, y: graphEntries[2]),
      IndividualLine(x: 3, y: graphEntries[3]),
      IndividualLine(x: 4, y: graphEntries[4]),
      IndividualLine(x: 5, y: graphEntries[5]),
      IndividualLine(x: 6, y: graphEntries[6]),
      IndividualLine(x: 7, y: graphEntries[7]),
      IndividualLine(x: 8, y: graphEntries[8]),
      IndividualLine(x: 9, y: graphEntries[9])
    ];
  }
}
