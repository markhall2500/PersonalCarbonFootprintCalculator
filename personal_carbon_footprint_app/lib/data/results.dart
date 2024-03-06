//Model for the carbon footprint results
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
  int noOfPeopleInHome = 0;
  String typesOfRecycling = '';
  int personalVehicleMiles = 0;
  int publicTransportMiles = 0;
  String flightMiles = '';

  Results(
      this.id,
      this.userId,
      this.score,
      this.rating,
      this.numberOfPeopleInHome,
      this.houseSize,
      this.foodHabits,
      this.packagingUse,
      this.washingMachineUsage,
      this.dishwasherUsage,
      this.newHouseholdPurchases,
      this.wheelieBinsFilled,
      this.noOfPeopleInHome,
      this.typesOfRecycling,
      this.personalVehicleMiles,
      this.publicTransportMiles,
      this.flightMiles);

  //Contructor for creating an object with the results entered
  Results.fromAnswers(Map<String, dynamic> recordMap) {
    id = recordMap['id'] ?? 0;
    timestamp = recordMap['timestamp'] ?? '';
    userId = recordMap['userId'] ?? 0;
    score = recordMap['score'] ?? '';
    rating = recordMap['rating'] ?? '';
    numberOfPeopleInHome = recordMap['numberOfPeopleInHome'] ?? '';
    houseSize = recordMap['houseSize'] ?? '';
    foodHabits = recordMap['foodHabits'] ?? '';
    packagingUse = recordMap['packagingUse'] ?? '';
    washingMachineUsage = recordMap['washingMachineUsage'] ?? '';
    dishwasherUsage = recordMap['dishwasherUsage'] ?? '';
    newHouseholdPurchases = recordMap['newHouseholdPurchases'] ?? '';
    wheelieBinsFilled = recordMap['wheelieBinsFilled'] ?? 0;
    noOfPeopleInHome = recordMap['noOfPeopleInHome'] ?? 0;
    typesOfRecycling = recordMap['typesOfRecycling'] ?? '';
    personalVehicleMiles = recordMap['personalVehicleMiles'] ?? 0;
    publicTransportMiles = recordMap['publicTransportMiles'] ?? 0;
    flightMiles = recordMap['flightMiles'] ?? '';
  }

  //A method to retrieve the results of an object in a json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'timestamp': timestamp,
      'userId': userId,
      'score': score,
      'rating': rating,
      'numberOfPeopleInHome': numberOfPeopleInHome,
      'houseSize' : houseSize,
      'foodHabits' : foodHabits,
      'packagingUse' : packagingUse,
      'washingMachineUsage' : washingMachineUsage,
      'dishwasherUsage' : dishwasherUsage,
      'newHouseholdPurchases' : newHouseholdPurchases,
      'wheelieBinsFilled' : wheelieBinsFilled,
      'noOfPeopleInHome' : noOfPeopleInHome,
      'typesOfRecycling' : typesOfRecycling,
      'personalVehicleMiles' : personalVehicleMiles,
      'publicTransportMiles' : publicTransportMiles,
      'flightMiles' : flightMiles
    };
  }
}
