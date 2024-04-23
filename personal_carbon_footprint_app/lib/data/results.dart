//This class stores the model for a result object when a user completes
//the questions on the carbon footprint page. These are used on the results
//page

class Results {
  int id = 0;
  String timestamp = '';
  int? userId;
  String score = '';
  String rating = '';
  int numberOfPeopleInHome = 0;
  String houseSize = '';
  String foodHabits = '';
  String packagingUse = '';
  String washingMachineUsage = '';
  String dishwasherUsage = '';
  String newHouseholdPurchases = '';
  int wheelieBinsFilled = 0;
  String typesOfRecycling = '';
  int personalVehicleMiles = 0;
  int publicTransportMiles = 0;
  String flightMiles = '';
  int numberOfPeopleInHomeScore = 0;
  int houseSizeScore = 0;
  int foodHabitsScore = 0;
  int packagingUseScore = 0;
  int washingMachineUsageScore = 0;
  int dishwasherUsageScore = 0;
  int newHouseholdPurchasesScore = 0;
  int wheelieBinsFilledScore = 0;
  int typesOfRecyclingScore = 0;
  int personalVehicleMilesScore = 0;
  int publicTransportMilesScore = 0;
  int flightMilesScore = 0;
  double carbonEmissionsScore = 0.0;

  Results(
      this.id,
      this.score,
      this.userId,
      this.rating,
      this.numberOfPeopleInHome,
      this.houseSize,
      this.foodHabits,
      this.packagingUse,
      this.washingMachineUsage,
      this.dishwasherUsage,
      this.newHouseholdPurchases,
      this.wheelieBinsFilled,
      this.typesOfRecycling,
      this.personalVehicleMiles,
      this.publicTransportMiles,
      this.flightMiles,
      this.numberOfPeopleInHomeScore,
      this.houseSizeScore,
      this.foodHabitsScore,
      this.packagingUseScore,
      this.washingMachineUsageScore,
      this.dishwasherUsageScore,
      this.newHouseholdPurchasesScore,
      this.wheelieBinsFilledScore,
      this.typesOfRecyclingScore,
      this.personalVehicleMilesScore,
      this.publicTransportMilesScore,
      this.flightMilesScore,
      this.carbonEmissionsScore);

  //Contructor for creating an object with the results entered
  Results.fromAnswers(Map<String, dynamic> recordMap) {
    id = recordMap['id'] ?? 0;
    timestamp = recordMap['timestamp'] ?? '';
    score = recordMap['score'] ?? '';
    userId = recordMap['userId'] ?? '';
    rating = recordMap['rating'] ?? '';
    numberOfPeopleInHome = recordMap['numberOfPeopleInHome'] ?? '';
    houseSize = recordMap['houseSize'] ?? '';
    foodHabits = recordMap['foodHabits'] ?? '';
    packagingUse = recordMap['packagingUse'] ?? '';
    washingMachineUsage = recordMap['washingMachineUsage'] ?? '';
    dishwasherUsage = recordMap['dishwasherUsage'] ?? '';
    newHouseholdPurchases = recordMap['newHouseholdPurchases'] ?? '';
    wheelieBinsFilled = recordMap['wheelieBinsFilled'] ?? 0;
    typesOfRecycling = recordMap['typesOfRecycling'] ?? '';
    personalVehicleMiles = recordMap['personalVehicleMiles'] ?? 0;
    publicTransportMiles = recordMap['publicTransportMiles'] ?? 0;
    flightMiles = recordMap['flightMiles'] ?? '';
    numberOfPeopleInHomeScore = recordMap['numberOfPeopleInHomeScore'] ?? 0;
    houseSizeScore = recordMap['houseSizeScore'] ?? 0;
    foodHabitsScore = recordMap['foodHabitsScore'] ?? 0;
    packagingUseScore = recordMap['packagingUseScore'] ?? 0;
    washingMachineUsageScore = recordMap['washingMachineUsageScore'] ?? 0;
    dishwasherUsageScore = recordMap['dishwasherUsageScore'] ?? 0;
    newHouseholdPurchasesScore = recordMap['newHouseholdPurchasesScore'] ?? 0;
    wheelieBinsFilledScore = recordMap['wheelieBinsFilledScore'] ?? 0;
    typesOfRecyclingScore = recordMap['typesOfRecyclingScore'] ?? 0;
    personalVehicleMilesScore = recordMap['personalVehicleMilesScore'] ?? 0;
    publicTransportMilesScore = recordMap['publicTransportMilesScore'] ?? 0;
    flightMilesScore = recordMap['flightMilesScore'] ?? 0;
    carbonEmissionsScore = recordMap['carbonEmissionsScore'] ?? 0.0;
  }

  //A method to retrieve the results of an object in a json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'timestamp': timestamp,
      'score': score,
      'userId': userId,
      'rating': rating,
      'numberOfPeopleInHome': numberOfPeopleInHome,
      'houseSize': houseSize,
      'foodHabits': foodHabits,
      'packagingUse': packagingUse,
      'washingMachineUsage': washingMachineUsage,
      'dishwasherUsage': dishwasherUsage,
      'newHouseholdPurchases': newHouseholdPurchases,
      'wheelieBinsFilled': wheelieBinsFilled,
      'typesOfRecycling': typesOfRecycling,
      'personalVehicleMiles': personalVehicleMiles,
      'publicTransportMiles': publicTransportMiles,
      'flightMiles': flightMiles,
      'numberOfPeopleInHomeScore': numberOfPeopleInHomeScore,
      'houseSizeScore': houseSizeScore,
      'foodHabitsScore': foodHabitsScore,
      'packagingUseScore': packagingUseScore,
      'washingMachineUsageScore': washingMachineUsageScore,
      'dishwasherUsageScore': dishwasherUsageScore,
      'newHouseholdPurchasesScore': newHouseholdPurchasesScore,
      'wheelieBinsFilledScore': wheelieBinsFilledScore,
      'typesOfRecyclingScore': typesOfRecyclingScore,
      'personalVehicleMilesScore': personalVehicleMilesScore,
      'publicTransportMilesScore': publicTransportMilesScore,
      'flightMilesScore': flightMilesScore,
      'carbonEmissionsScore': carbonEmissionsScore
    };
  }
}
