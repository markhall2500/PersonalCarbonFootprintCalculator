import 'package:personal_carbon_footprint_app/data/results.dart';

//This class provides the values which are displayed in the carbon footprint
//questions, specifically where there is a previous result
class QuestionsPreviousResults {
  //Private constructor to prevent instantiation
  QuestionsPreviousResults._();

  //Method to populate the number of people in the house form field
  static String? numberOfPeopleInHousePreviousResult(List<Results> results) {
    if (results.isEmpty) {
      return null;
    }

    return results.last.numberOfPeopleInHome.toString();
  }

  //Method to populate the house size form field
  static String? houseSizePreviousResult(List<Results> results) {
    if (results.isEmpty) {
      return null;
    }

    return results.last.houseSize;
  }

  //Method to populate the food habits form field
  static String? foodHabitsPreviousResult(List<Results> results) {
    if (results.isEmpty) {
      return null;
    }

    return results.last.foodHabits;
  }

  //Method to populate the food packaging form field
  static String? foodPackagingPreviousResult(List<Results> results) {
    if (results.isEmpty) {
      return null;
    }

    return results.last.packagingUse;
  }

  //Method to populate the washing machine form field
  static String? washingMachinePreviousResult(List<Results> results) {
    if (results.isEmpty) {
      return null;
    }

    return results.last.washingMachineUsage;
  }

  //Method to populate the dishwasher form field
  static String? dishwasherPreviousResult(List<Results> results) {
    if (results.isEmpty) {
      return null;
    }

    return results.last.dishwasherUsage;
  }

  //Method to populate the new household items form field
  static String? newHouseholdItemsPreviousResult(List<Results> results) {
    if (results.isEmpty) {
      return null;
    }

    return results.last.newHouseholdPurchases;
  }

   //Method to populate the new household items form field
  static String? wheelieBinsPreviousResult(List<Results> results) {
    if (results.isEmpty) {
      return null;
    }

    return results.last.wheelieBinsFilled.toString();
  }

  //Method to populate the new household items form field
  static List<bool> typesOfRecyclingPreviousResult(List<Results> results) {
    //List of recycling options (Glass, Plastic, Paper, Aluminum, Steel, Food waste)
    List<bool> listOfRecycling = [false, false, false, false, false, false];

    if (results.isEmpty) {
      return listOfRecycling;
    }
    if (results.last.typesOfRecycling.contains('Glass')) {
      listOfRecycling[0] = true;
    }
    if (results.last.typesOfRecycling.contains('Plastic')) {
      listOfRecycling[1] = true;
    }
    if (results.last.typesOfRecycling.contains('Paper')) {
      listOfRecycling[2] = true;
    }
    if (results.last.typesOfRecycling.contains('Aluminum')) {
      listOfRecycling[3] = true;
    }
    if (results.last.typesOfRecycling.contains('Steel')) {
      listOfRecycling[4] = true;
    }
    if (results.last.typesOfRecycling.contains('Food waste')) {
      listOfRecycling[5] = true;
    }

    return listOfRecycling;
  }

  //Method to populate the personal vehicle miles form field
  static String? personalVehicleMilesPreviousResult(List<Results> results) {
    if (results.isEmpty) {
      return null;
    }

    return results.last.personalVehicleMiles.toString();
  }

  //Method to populate the public transport miles form field
  static String? publicTransportMilesPreviousResult(List<Results> results) {
    if (results.isEmpty) {
      return null;
    }

    return results.last.publicTransportMiles.toString();
  }

  //Method to populate the public transport miles form field
  static String? flightsMilesPreviousResult(List<Results> results) {
    if (results.isEmpty) {
      return null;
    }

    return results.last.flightMiles.toString();
  }
}
