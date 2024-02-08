//A class containing static methods to perform the points calculations
//on the carbon footprint questions page

import 'package:personal_carbon_footprint_app/shared/globals.dart';

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
        improvementSuggestions.add("Consider beoming a vegan");
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
      case 'Mostly Prepackaged convienience food items':
        points = 12;
        improvementSuggestions
            .add("Consider eating more fresh food and less prepacked food");
        break;
      case 'Balance of prepackaged and fresh food items':
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

  //Methods to calculate points for the recycilng options result
  static String calculateRating(int carbonFootprintResult) {
    if (carbonFootprintResult < 40) {
      return 'Diamond';
    }
    if (carbonFootprintResult >= 40 && carbonFootprintResult < 55) {
      return 'Platinum';
    }
    if (carbonFootprintResult >= 55 && carbonFootprintResult < 70) {
      return 'Gold';
    }
    if (carbonFootprintResult >= 70 && carbonFootprintResult < 85) {
      return 'Silver';
    }
    if (carbonFootprintResult >= 85) {
      return 'Bronze';
    }
    return 'Invalid result';
  }

  //Methods to calculate points for the recycilng options result
  static String calculateImprovementSuggestions(
      List<String> carbonFootprintResult) {
    String stringToReturn = '';
    carbonFootprintResult.forEach((element) {
      stringToReturn = stringToReturn + '> ' + element + '\n';
    });
    //Clear the collection to prevent on screen duplication when re-calculating
    improvementSuggestions = [];
    return stringToReturn;
  }
}
