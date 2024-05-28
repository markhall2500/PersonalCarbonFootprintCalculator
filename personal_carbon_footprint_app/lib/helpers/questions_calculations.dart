import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:personal_carbon_footprint_app/data/results.dart';
import 'package:personal_carbon_footprint_app/shared/globals.dart';

//This class manages the calculations for the questions which are generated
//as a part of the carbon footprint questions completion process
class QuestionsCalculations {
  //Private constructor to prevent instantiation
  QuestionsCalculations._();

  //Methods to calculate points for the carbon footprint result
  static int calculatePointsForNumberOfPeopleInHome(int numberOfPeopleInHome) {
    int points = 0;
    switch (numberOfPeopleInHome) {
      case 1:
        points = 14;
        break;
      case 2:
        points = 12;
        break;
      case 3:
        points = 10;
        break;
      case 4:
        points = 8;
        break;
      case 5:
        points = 6;
        break;
      case 6:
        points = 4;
        break;
      default:
        points = 2;
    }
    return points;
  }

  //Methods to calculate points for the house size result
  static int calculateHouseSize(String houseSize) {
    int points = 0;
    switch (houseSize) {
      case 'Large':
        points = 10;
        break;
      case 'Medium':
        points = 7;
        break;
      case 'Small':
        points = 4;
        break;
      case 'Apartment':
        points = 2;
        break;
    }
    return points;
  }

  //Methods to calculate points for the food habit result
  static int calculateFoodHabits(String foodHabit) {
    int points = 0;
    switch (foodHabit) {
      case 'Eat meat daily':
        points = 10;
        improvementSuggestions
            .add("Consider eating less meat and more vegetables");
        break;
      case 'Eat meat a few times a week':
        points = 8;
        improvementSuggestions.add("Consider becoming a vegetarian");
        break;
      case 'Vegetarian':
        points = 4;
        improvementSuggestions.add("Consider becoming a vegan");
        break;
      case 'Vegan':
        points = 2;
        break;
    }
    return points;
  }

  //Methods to calculate points for the food packaging result
  static int calculateFoodPackaging(String foodPackaging) {
    int points = 0;
    switch (foodPackaging) {
      case 'Mostly Prepackaged food':
        points = 12;
        improvementSuggestions
            .add("Consider eating more fresh food and less prepacked food");
        break;
      case 'Prepackaged and fresh food':
        improvementSuggestions
            .add("Consider switching to only eating fresh food");
        points = 6;
        break;
      case 'Only fresh food items':
        points = 2;
        break;
    }
    return points;
  }

  //Methods to calculate points for the wsahing machine usage result
  static int calculateWashingMachine(String washingMachineUsage) {
    int points = 0;
    String reductionMessage =
        "Consider reducing your weekly washing machine usage";
    switch (washingMachineUsage) {
      case 'More than 9 times per week':
        improvementSuggestions.add(reductionMessage);
        points = 3;
        break;
      case '4-9 times per week':
        improvementSuggestions.add(reductionMessage);
        points = 2;
        break;
      case '1-3 times per week':
        points = 1;
        break;
      case 'I do not own a washing machine':
        points = 0;
        break;
    }
    return points;
  }

  //Methods to calculate points for the dishwasher usage result
  static int calculateDishwasher(String dishwasherUsage) {
    int points = 0;
    String reductionMessage = "Consider reducing your weekly dishwasher usage";
    switch (dishwasherUsage) {
      case 'More than 9 times per week':
        improvementSuggestions.add(reductionMessage);
        points = 3;
        break;
      case '4-9 times per week':
        improvementSuggestions.add(reductionMessage);
        points = 2;
        break;
      case '1-3 times per week':
        points = 1;
        break;
      case 'I do not own a washing machine':
        points = 0;
        break;
    }
    return points;
  }

  //Methods to calculate points for the household purchases result
  static int calculateHouseholdPurchases(String householdPurchases) {
    int points = 0;
    String reductionMessage =
        "Consider purchasing second hand or fewer new household purchases";
    switch (householdPurchases) {
      case 'More than 7 new items':
        improvementSuggestions.add(reductionMessage);
        points = 10;
        break;
      case '5-7 new items':
        improvementSuggestions.add(reductionMessage);
        points = 8;
        break;
      case '3-5 new items':
        improvementSuggestions.add(reductionMessage);
        points = 6;
        break;
      case 'Less than 3 items':
        improvementSuggestions.add(reductionMessage);
        points = 4;
        break;
      case 'Almost nothing or second hand only':
        points = 2;
        break;
    }
    return points;
  }

  //Methods to calculate points for number of wheelie bins result
  static int calculateNumberOfWheelieBinsFilled(int wheelieBinsFilled) {
    int points = 0;
    String reductionMessage =
        "Consider reducing non-recycling wheelie bin waste";
    switch (wheelieBinsFilled) {
      case 3:
        improvementSuggestions.add(reductionMessage);
        points = 40;
        break;
      case 2:
        improvementSuggestions.add(reductionMessage);
        points = 30;
        break;
      case 1:
        improvementSuggestions.add(reductionMessage);
        points = 20;
        break;
      case 0:
        points = 5;
        break;
      default:
        points = 50;
    }
    return points;
  }

  //Methods to calculate points for the personal vehicle usage result
  static int calculatePersonalVehicleUsage(int personalVehicle) {
    int points = 0;
    String reductionMessage = "Consider reducing your personal vehicle usage";
    if (personalVehicle > 15000) {
      improvementSuggestions.add(reductionMessage);
      points = 12;
    } else if (personalVehicle > 10000 && personalVehicle <= 15000) {
      improvementSuggestions.add(reductionMessage);
      points = 10;
    } else if (personalVehicle > 1000 && personalVehicle <= 10000) {
      improvementSuggestions.add(reductionMessage);
      points = 6;
    } else if (personalVehicle > 0 && personalVehicle <= 1000) {
      improvementSuggestions.add(reductionMessage);
      points = 4;
    } else {
      points = 0;
    }
    return points;
  }

  //Methods to calculate points for the public transport usage result
  static int calculatePublicTransportUsage(int publicTransport) {
    int points = 0;
    String reductionMessage = "Consider reducing your public transport usage";
    if (publicTransport > 20000) {
      improvementSuggestions.add(reductionMessage);
      points = 12;
    } else if (publicTransport > 15000 && publicTransport <= 20000) {
      improvementSuggestions.add(reductionMessage);
      points = 10;
    } else if (publicTransport > 10000 && publicTransport <= 15000) {
      points = 6;
      improvementSuggestions.add(reductionMessage);
    } else if (publicTransport > 1000 && publicTransport <= 10000) {
      improvementSuggestions.add(reductionMessage);
      points = 4;
    } else if (publicTransport > 0 && publicTransport <= 1000) {
      improvementSuggestions.add(reductionMessage);
      points = 2;
    } else {
      points = 0;
    }
    return points;
  }

  //Methods to calculate points for the flights usage result
  static int calculateFlightsUsage(String flightsUsage) {
    int points = 0;
    switch (flightsUsage) {
      case 'Worldwide':
        improvementSuggestions.add("Consider only taking european flights");
        points = 3;
        break;
      case 'Only within Europe':
        improvementSuggestions.add("Consider only taking UK flights");
        points = 2;
        break;
      case 'Only within the UK':
        improvementSuggestions.add("Consider reducing your flight usage");
        points = 1;
        break;
      case 'No flights':
        points = 0;
        break;
    }
    return points;
  }

  //Methods to calculate points for the recycilng options result
  static int calculateRecyclingOptions(Map<String, bool?> recyclingOptions) {
    int points = 24;
    if (recyclingOptions['Glass'] == true) {
      points -= 4;
    } else {
      improvementSuggestions.add("Consider recycling your glass");
    }
    if (recyclingOptions['Plastic'] == true) {
      points -= 4;
    } else {
      improvementSuggestions.add("Consider recycling your plastic");
    }
    if (recyclingOptions['Paper'] == true) {
      points -= 4;
    } else {
      improvementSuggestions.add("Consider recycling your paper");
    }
    if (recyclingOptions['Aluminum'] == true) {
      points -= 4;
    } else {
      improvementSuggestions.add("Consider recycling your aluminum");
    }
    if (recyclingOptions['Steel'] == true) {
      points -= 4;
    } else {
      improvementSuggestions.add("Consider recycling your steel");
    }
    if (recyclingOptions['Food waste'] == true) {
      points -= 4;
    } else {
      improvementSuggestions.add("Consider recycling your food waste");
    }
    return points;
  }

  //Methods to calculate points for the recycling options result
  static String calculateRating(int carbonFootprintResult) {
    if (carbonFootprintResult < 33) {
      return 'Diamond';
    }
    if (carbonFootprintResult >= 33 && carbonFootprintResult < 66) {
      return 'Platinum';
    }
    if (carbonFootprintResult >= 66 && carbonFootprintResult < 99) {
      return 'Gold';
    }
    if (carbonFootprintResult >= 99 && carbonFootprintResult < 132) {
      return 'Silver';
    }
    if (carbonFootprintResult >= 132) {
      return 'Bronze';
    }
    return 'Invalid result';
  }

  //Methods to calculate points for the recycilng options result
  static String calculateImprovementSuggestions(
      List<String> carbonFootprintResult) {
    String stringToReturn = '';
    for (var element in carbonFootprintResult) {
      stringToReturn = '$stringToReturn> $element\n';
    }
    if (stringToReturn == '') {
      stringToReturn =
          '> Currently we have no further recommendations for you!\n> Well done!';
    }
    //Clear the collection to prevent on screen duplication when re-calculating
    improvementSuggestions = [];
    return stringToReturn;
  }

  //Method to create a string containing all of the recycling options
  static getRecyclingOptionsAsString(Map<String, bool?> recyclingOptions) {
    String recyclingOptionsAsString = '';
    if (recyclingOptions['Glass'] == true) {
      recyclingOptionsAsString = '$recyclingOptionsAsString\n   Glass';
    }
    if (recyclingOptions['Plastic'] == true) {
      recyclingOptionsAsString = '$recyclingOptionsAsString\n   Plastic';
    }
    if (recyclingOptions['Paper'] == true) {
      recyclingOptionsAsString = '$recyclingOptionsAsString\n   Paper';
    }
    if (recyclingOptions['Aluminum'] == true) {
      recyclingOptionsAsString = '$recyclingOptionsAsString\n   Aluminum';
    }
    if (recyclingOptions['Steel'] == true) {
      recyclingOptionsAsString = '$recyclingOptionsAsString\n   Steel';
    }
    if (recyclingOptions['Food waste'] == true) {
      recyclingOptionsAsString = '$recyclingOptionsAsString\n   Food waste';
    }
    return recyclingOptionsAsString;
  }

  //Method to set the animation based on the rating recieved
  static Widget? getAnimation(String rating) {
    Widget? animation;
    switch (rating) {
      case "Bronze":
        animation = Lottie.asset('assets/bronzeAnimation.json',
            width: 150, height: 150, fit: BoxFit.fill);
        break;
      case "Silver":
        animation = Lottie.asset('assets/silverAnimation.json',
            width: 150, height: 150, fit: BoxFit.fill);
        break;
      case "Gold":
        animation = Lottie.asset('assets/goldAnimation.json',
            width: 150, height: 150, fit: BoxFit.fill);
        break;
      case "Platinum":
        animation = Lottie.asset('assets/platinumAnimation.json',
            width: 250, height: 150, fit: BoxFit.fill);
        break;
      case "Diamond":
        animation = Lottie.asset('assets/diamondAnimation.json',
            width: 150, height: 150, fit: BoxFit.fill);
        break;
      default:
        animation = null;
    }

    return animation;
  }

  //Method to set the colour of the rating based on the rating recieved
  static Color? getColourFromRating(String rating) {
    Color? colour;
    switch (rating) {
      case "Bronze":
        colour = const Color.fromRGBO(194, 121, 4, 0.996);
        break;
      case "Silver":
        colour = const Color.fromRGBO(76, 77, 77, 0.914);
        break;
      case "Gold":
        colour = const Color.fromRGBO(225, 183, 0, 1);
        break;
      case "Platinum":
        colour = const Color.fromRGBO(13, 205, 176, 0.601);
        break;
      case "Diamond":
        colour = const Color.fromRGBO(4, 17, 158, 0.478);
        break;
      default:
        colour = null;
    }

    return colour;
  }

  //Method to return a calculation in CO2e kg based on the compeleted results
  static double calculateCarbonEmissionsValue(Results result) {
    double carbonEmissionsResultInKg = 0.0;

    //Value for food habits
    switch (result.foodHabits) {
      case 'Eat meat daily':
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 33.25;
        break;
      case 'Eat meat a few times a week':
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 26.6;
        break;
      case 'Vegetarian':
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 13.3;
        break;
      case 'Vegan':
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 6.65;
        break;
    }

    //Value for food packaging
    switch (result.packagingUse) {
      case 'Mostly Prepackaged food':
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 14.22;
        break;
      case 'Prepackaged and fresh food':
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 7.11;
        break;
      case 'Only fresh food items':
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 2.37;
        break;
    }

    //Value for washing machine use
    switch (result.washingMachineUsage) {
      case 'More than 9 times per week':
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 7.0;
        break;
      case '4-9 times per week':
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 4.2;
        break;
      case '1-3 times per week':
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 1.4;
        break;
      case 'I do not own a washing machine':
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 0.0;
        break;
      default:
        0.0;
    }

    //Value for dishwasher use
    switch (result.dishwasherUsage) {
      case 'More than 9 times per week':
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 5.43;
        break;
      case '4-9 times per week':
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 3.26;
        break;
      case '1-3 times per week':
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 1.08;
        break;
      case 'I do not own a washing machine':
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 0.0;
        break;
      default:
        0.0;
    }

    //Value for new household purchases
    switch (result.newHouseholdPurchases) {
      case 'More than 7 new items':
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 16.24;
        break;
      case '5-7 new items':
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 12.18;
        break;
      case '3-5 new items':
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 8.12;
        break;
      case 'Less than 3 items':
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 4.06;
        break;
      case 'Almost nothing or second hand only':
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 2.03;
        break;
    }

    //Number of wheelie bins filled
    switch (result.wheelieBinsFilled) {
      case 0:
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 0.0;
        break;
      case 1:
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 31.5;
        break;
      case 2:
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 63;
        break;
      case 3:
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 94.5;
        break;
      case > 3:
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 126;
      default:
        0.0;
    }

    //Recycling offsets
    if (result.typesOfRecycling.contains('Glass')) {
      carbonEmissionsResultInKg = carbonEmissionsResultInKg - 1.06;
    }
    if (result.typesOfRecycling.contains('Plastic')) {
      carbonEmissionsResultInKg = carbonEmissionsResultInKg - 1.06;
    }
    if (result.typesOfRecycling.contains('Paper')) {
      carbonEmissionsResultInKg = carbonEmissionsResultInKg - 1.06;
    }
    if (result.typesOfRecycling.contains('Aluminum')) {
      carbonEmissionsResultInKg = carbonEmissionsResultInKg - 1.06;
    }
    if (result.typesOfRecycling.contains('Steel')) {
      carbonEmissionsResultInKg = carbonEmissionsResultInKg - 1.06;
    }
    if (result.typesOfRecycling.contains('Food waste')) {
      carbonEmissionsResultInKg = carbonEmissionsResultInKg - 1.06;
    }

    //Personal vehicle milage
    double personalVehicleMileage = 0.07519 * result.personalVehicleMiles;
    carbonEmissionsResultInKg =
        carbonEmissionsResultInKg + personalVehicleMileage;

    //Public transport milage
    double publicTransportMileage = 0.04350 * result.publicTransportMiles;
    carbonEmissionsResultInKg =
        carbonEmissionsResultInKg + publicTransportMileage;

    //Flights usage
    switch (result.flightMiles) {
      case 'Worldwide':
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 76.96;
        break;
      case 'Only within Europe':
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 38.48;
        break;
      case 'Only within the UK':
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 9.62;
        break;
      case 'No flights':
        carbonEmissionsResultInKg = carbonEmissionsResultInKg + 0.0;
        break;
    }

    //Return collated carbon emissions score
    return carbonEmissionsResultInKg;
  }
}
