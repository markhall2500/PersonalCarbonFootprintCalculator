import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_carbon_footprint_app/data/results.dart';
import 'package:personal_carbon_footprint_app/data/results_input.dart';
import 'package:personal_carbon_footprint_app/data/sp_helper.dart';
import 'package:personal_carbon_footprint_app/helpers/questions_calculations.dart';
import 'package:personal_carbon_footprint_app/helpers/questions_validators.dart';
import 'package:personal_carbon_footprint_app/shared/globals.dart';
import 'package:personal_carbon_footprint_app/shared/menu_drawer.dart';
import '../shared/menu_bottom.dart';

//Stateful class which contains the questions for the calculating the
//users personal carbon footprint
class CarbonFootprintQuestionsScreen extends StatefulWidget {
  const CarbonFootprintQuestionsScreen({super.key});

  @override
  State<CarbonFootprintQuestionsScreen> createState() =>
      _CarbonFootprintQuestionsScreenState();
}

class _CarbonFootprintQuestionsScreenState
    extends State<CarbonFootprintQuestionsScreen> {
  //This key will be used to identify the state of the form.
  final _formKey = GlobalKey<FormState>();
  final SPHelper helper = SPHelper();

  //Text editing conrolling variables for the text field questions
  final TextEditingController txtNumberOfPeopleInHome = TextEditingController();
  final TextEditingController txtNumberOfWheelieBinsFilled =
      TextEditingController();
  final TextEditingController txtPersonalVehicleUsage = TextEditingController();
  final TextEditingController txtPublicTransportUsage = TextEditingController();

  //variables for the fontsize and results variables
  final double fontSize = 14;
  String result = '';
  String rating = '';
  String improvementSuggestionsFormatted = '';

  //Variables for help text on questions
  String numberOfPeopleInHomeMessage = '';
  String numberOfWheelieBinsFilledMessage = '';
  String personalVehicleUsageMessage = "";
  String publicTransportUsageMessage = "";

  //Variables for house size drop down
  List<String> houseSizesDropDown = ['Large', 'Medium', 'Small', 'Apartment'];
  String? selectedSizeOfHouse;

  //Variables for food choices
  List<String> foodHabitsDropDown = [
    'Eat meat daily',
    'Eat meat a few times a week',
    'Vegetarian',
    'Vegan'
  ];
  String? selectedFoodHabits;

  //Variables for food packaging choices
  List<String> foodPackagingDropDown = [
    'Mostly Prepackaged convienience food items',
    'Balance of prepackaged and fresh food items',
    'Only fresh food items'
  ];
  String? selectedFoodPackaging;

  //Variables for washing machine usage choices
  List<String> washingMachineUsageDropDown = [
    'More than 9 times per week',
    '4-9 times per week',
    '1-3 times per week',
    'I do not own a washing machine'
  ];
  String? selectedWashingMachineUsage;

  //Variables for dishwasher usage choices
  List<String> dishwasherUsageDropDown = [
    'More than 9 times per week',
    '4-9 times per week',
    '1-3 times per week',
    'I do not own a dishwasher'
  ];
  String? selectedDishwasherUsage;

  //Variables for dishwasher usage choices
  List<String> householdPurchasesDropDown = [
    'More than 7 new items',
    '5-7 new items',
    '3-5 new items',
    'Less than 3 items',
    'Almost nothing or second hand only'
  ];
  String? selectedHouseholdPurchases;

  //Variables for flights usage choices
  List<String> flightsUsageDropDown = [
    'No flights',
    'Only within the UK',
    'Only within Europe',
    'Worldwide'
  ];
  String? selectedFlightsUsage;

  //Variables for dishwasher usage choices
  Map<String, bool?> recyclingOptionsCheckboxes = {
    'Glass': false,
    'Plastic': false,
    'Paper': false,
    'Aluminum': false,
    'Steel': false,
    'Food waste': false
  };

  @override
  Widget build(BuildContext context) {
    numberOfPeopleInHomeMessage =
        'Please enter the number of people in your house';
    numberOfWheelieBinsFilledMessage =
        'How many non-recycle wheelie bins do you fill each week?';
    personalVehicleUsageMessage =
        'How many miles per year in your personal vehicle?';
    publicTransportUsageMessage =
        'How many miles per year on public transport?';

    //Scaffold which will build the questions page in the UI
    return Scaffold(
      appBar: AppBar(title: const Text('Carbon Footprint Calculator')),
      bottomNavigationBar: const MenuBottom(),
      drawer: const MenuDrawer(),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/blueSky.jpg'), fit: BoxFit.cover)),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(children: [
              //Title for the page
              const Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Text(
                    'Carbon Footprint Questions',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )),
              //Description for the page
              Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    'Complete the questions below to calculate your personal carbon footprint. When complete, you wil recieve a rating of \nBronze / Silver / Gold / Platinum / Diamond',
                    style: TextStyle(
                        fontSize: fontSize, fontWeight: FontWeight.bold),
                  )),
              //Question for number of people in the home
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: TextFormField(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize,
                    ),
                    controller: txtNumberOfPeopleInHome,
                    decoration:
                        InputDecoration(hintText: numberOfPeopleInHomeMessage),
                    validator: (value) {
                      return QuestionsValidators.numberOfPeopleInHouseValidator(
                          value);
                    },
                    keyboardType: TextInputType.number),
              ),
              //Questions for the house size
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: DropdownButtonFormField(
                  validator: (value) {
                    return QuestionsValidators.houseSizeValidator(value);
                  },
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: fontSize),
                  hint: const Text('Please select your house size'),
                  value: selectedSizeOfHouse,
                  onChanged: (newValue) {
                    setState(() {
                      selectedSizeOfHouse = newValue;
                    });
                  },
                  items: houseSizesDropDown.map((size) {
                    return DropdownMenuItem(
                      value: size,
                      child: Text(size),
                    );
                  }).toList(),
                ),
              ),
              //Question for food habits
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: DropdownButtonFormField(
                  validator: (value) {
                    return QuestionsValidators.foodHabitsValidator(value);
                  },
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: fontSize),
                  hint: const Text('Please select your food habits'),
                  value: selectedFoodHabits,
                  onChanged: (newValue) {
                    setState(() {
                      selectedFoodHabits = newValue;
                    });
                  },
                  items: foodHabitsDropDown.map((habits) {
                    return DropdownMenuItem(
                      value: habits,
                      child: Text(habits),
                    );
                  }).toList(),
                ),
              ),
              //Question for food packaging usage
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: DropdownButtonFormField(
                  validator: (value) {
                    return QuestionsValidators.foodPackagingUseValidator(value);
                  },
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: fontSize),
                  hint: const Text('Please select your food packaging use'),
                  value: selectedFoodPackaging,
                  onChanged: (newValue) {
                    setState(() {
                      selectedFoodPackaging = newValue;
                    });
                  },
                  items: foodPackagingDropDown.map((packaging) {
                    return DropdownMenuItem(
                      value: packaging,
                      child: Text(packaging),
                    );
                  }).toList(),
                ),
              ),
              //Question for washing machine usage
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: DropdownButtonFormField(
                  validator: (value) {
                    return QuestionsValidators.washingMachineUsageValidator(
                        value);
                  },
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: fontSize),
                  hint: const Text('How often do you use your washing machine?'),
                  value: selectedWashingMachineUsage,
                  onChanged: (newValue) {
                    setState(() {
                      selectedWashingMachineUsage = newValue;
                    });
                  },
                  items: washingMachineUsageDropDown.map((washingMachine) {
                    return DropdownMenuItem(
                      value: washingMachine,
                      child: Text(washingMachine),
                    );
                  }).toList(),
                ),
              ),
              //Questions for dishwasher usage
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: DropdownButtonFormField(
                  validator: (value) {
                    return QuestionsValidators.dishwasherUsageValidator(value);
                  },
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: fontSize),
                  hint: const Text('How often do you use your dishwasher?'),
                  value: selectedDishwasherUsage,
                  onChanged: (newValue) {
                    setState(() {
                      selectedDishwasherUsage = newValue;
                    });
                  },
                  items: dishwasherUsageDropDown.map((dishwasher) {
                    return DropdownMenuItem(
                      value: dishwasher,
                      child: Text(dishwasher),
                    );
                  }).toList(),
                ),
              ),
              //Question for new household items
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: DropdownButtonFormField(
                  validator: (value) {
                    return QuestionsValidators.newHouseholdItemsValidator(
                        value);
                  },
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: fontSize),
                  hint:
                      const Text('How many new household items do you buy per year?'),
                  value: selectedHouseholdPurchases,
                  onChanged: (newValue) {
                    setState(() {
                      selectedHouseholdPurchases = newValue;
                    });
                  },
                  items: householdPurchasesDropDown.map((householdPurchases) {
                    return DropdownMenuItem(
                      value: householdPurchases,
                      child: Text(householdPurchases),
                    );
                  }).toList(),
                ),
              ),
              //Question for number of wheelie bins filles
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: TextFormField(
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: fontSize),
                    controller: txtNumberOfWheelieBinsFilled,
                    decoration: InputDecoration(
                        hintText: numberOfWheelieBinsFilledMessage),
                    validator: (value) {
                      return QuestionsValidators
                          .numberOfWheelieBinsFilledValidator(value);
                    },
                    keyboardType: TextInputType.number),
              ),
              //Header and question for types of waste recycled
              Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    'Which types of waste do you recycle?',
                    style: TextStyle(
                        fontSize: fontSize, fontWeight: FontWeight.bold),
                  )),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        CheckboxListTile(
                            title: Text(
                              'Glass',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: fontSize),
                            ),
                            value: recyclingOptionsCheckboxes['Glass'],
                            onChanged: (bool? value) {
                              setState(() {
                                recyclingOptionsCheckboxes['Glass'] = value;
                              });
                            }),
                        CheckboxListTile(
                            title: Text(
                              'Plastic',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: fontSize),
                            ),
                            value: recyclingOptionsCheckboxes['Plastic'],
                            onChanged: (bool? value) {
                              setState(() {
                                recyclingOptionsCheckboxes['Plastic'] = value;
                              });
                            }),
                        CheckboxListTile(
                            title: Text(
                              'Paper',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: fontSize),
                            ),
                            value: recyclingOptionsCheckboxes['Paper'],
                            onChanged: (bool? value) {
                              setState(() {
                                recyclingOptionsCheckboxes['Paper'] = value;
                              });
                            }),
                        CheckboxListTile(
                            title: Text(
                              'Aluminum',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: fontSize),
                            ),
                            value: recyclingOptionsCheckboxes['Aluminum'],
                            onChanged: (bool? value) {
                              setState(() {
                                recyclingOptionsCheckboxes['Aluminum'] = value;
                              });
                            }),
                        CheckboxListTile(
                            title: Text(
                              'Steel',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: fontSize),
                            ),
                            value: recyclingOptionsCheckboxes['Steel'],
                            onChanged: (bool? value) {
                              setState(() {
                                recyclingOptionsCheckboxes['Steel'] = value;
                              });
                            }),
                        CheckboxListTile(
                            title: Text(
                              'Food waste',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: fontSize),
                            ),
                            value: recyclingOptionsCheckboxes['Food waste'],
                            onChanged: (bool? value) {
                              setState(() {
                                recyclingOptionsCheckboxes['Food waste'] =
                                    value;
                              });
                            })
                      ],
                    )),
              ),
              //Question for personal vehicle usage
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: TextFormField(
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: fontSize),
                    controller: txtPersonalVehicleUsage,
                    decoration:
                        InputDecoration(hintText: personalVehicleUsageMessage),
                    validator: (value) {
                      return QuestionsValidators.personalVehicleMilageValidator(
                          value);
                    },
                    keyboardType: TextInputType.number),
              ),
              //Question for public transport usage
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: TextFormField(
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: fontSize),
                    controller: txtPublicTransportUsage,
                    decoration:
                        InputDecoration(hintText: publicTransportUsageMessage),
                    validator: (value) {
                      return QuestionsValidators.publicTransportMilageValidator(
                          value);
                    },
                    keyboardType: TextInputType.number),
              ),
              //Question for flights per year
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: DropdownButtonFormField(
                  validator: (value) {
                    return QuestionsValidators.flightsPerYearValidator(value);
                  },
                  style: TextStyle(
                      fontSize: fontSize, fontWeight: FontWeight.bold),
                  hint: const Text('Where have you taken flights this year?'),
                  value: selectedFlightsUsage,
                  onChanged: (newValue) {
                    setState(() {
                      selectedFlightsUsage = newValue;
                    });
                  },
                  items: flightsUsageDropDown.map((flightsUsage) {
                    return DropdownMenuItem(
                      value: flightsUsage,
                      child: Text(flightsUsage),
                    );
                  }).toList(),
                ),
              ),
              //Form submission
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        Results result = calculateCarbonFootprint();
                        DateTime now = DateTime.now();
                        String timestamp = DateFormat("dd/MM/yyyy   hh:mm:ss")
                            .format(now)
                            .toString();
                        int id = helper.getCounter() + 1;
                        result.id = id;
                        result.timestamp = timestamp;

                        helper.writeResults(result).then((_) {
                          helper.setCounter();
                        });
                      }
                    },
                    child: Text('Calculate your footprint',
                        style: TextStyle(fontSize: fontSize))),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  result,
                  style: TextStyle(
                      fontSize: fontSize, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  rating,
                  style: TextStyle(
                      fontSize: fontSize, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  improvementSuggestionsFormatted,
                  style: TextStyle(
                      fontSize: fontSize, fontWeight: FontWeight.bold),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  //Method to perform the calculation for the carbon footprint
  Results calculateCarbonFootprint() {
    //Variables to obtain the values entered on the form.
    ResultsInput resultsInput =
        ResultsInput(0, '', '', '', '', '', '', 0, 0, 0, '', {});
    resultsInput.numberOfPeopleInHomeInput =
        int.tryParse(txtNumberOfPeopleInHome.text) ?? 0;
    resultsInput.houseSizeInput = selectedSizeOfHouse.toString();
    resultsInput.foodHabitsInput = selectedFoodHabits.toString();
    resultsInput.foodPackagingInput = selectedFoodPackaging.toString();
    resultsInput.washingMachineInput = selectedWashingMachineUsage.toString();
    resultsInput.dishwasherInput = selectedDishwasherUsage.toString();
    resultsInput.householdPurchasesInput =
        selectedHouseholdPurchases.toString();
    resultsInput.numberOfWheelieBinsFilledInput =
        int.tryParse(txtNumberOfWheelieBinsFilled.text) ?? 0;
    resultsInput.personalVehicleUsageInput =
        int.tryParse(txtPersonalVehicleUsage.text) ?? 0;
    resultsInput.publicTransportUsageInput =
        int.tryParse(txtPublicTransportUsage.text) ?? 0;
    resultsInput.flightsUsageInput = selectedFlightsUsage.toString();
    resultsInput.recyclingOptionsCheckboxesInput = recyclingOptionsCheckboxes;

    //Updates to points variables.
    //This is done by calling the calculation methods for each question.
    int noOfPeopleInHomeScore =
        QuestionsCalculations.calculatePointsForNumberOfPeopleInHome(
            resultsInput.numberOfPeopleInHomeInput);
    int houseSizeScore =
        QuestionsCalculations.calculateHouseSize(resultsInput.houseSizeInput);
    int foodHabitsScore =
        QuestionsCalculations.calculateFoodHabits(resultsInput.foodHabitsInput);
    int packagingUseScore = QuestionsCalculations.calculateFoodPackaging(
        resultsInput.foodPackagingInput);
    int washingMachineUsageScore =
        QuestionsCalculations.calculateWashingMachine(
            resultsInput.washingMachineInput);
    int dishwasherUsageScore =
        QuestionsCalculations.calculateDishwasher(resultsInput.dishwasherInput);
    int newHouseholdPurchasesScore =
        QuestionsCalculations.calculateHouseholdPurchases(
            resultsInput.householdPurchasesInput);
    int wheelieBinsFilledScore =
        QuestionsCalculations.calculateNumberOfWheelieBinsFilled(
            resultsInput.numberOfWheelieBinsFilledInput);
    int personalVehicleMilesScore =
        QuestionsCalculations.calculatePersonalVehicleUsage(
            resultsInput.personalVehicleUsageInput);
    int publicTransportMilesScore =
        QuestionsCalculations.calculatePublicTransportUsage(
            resultsInput.publicTransportUsageInput);
    int flightMilesScore = QuestionsCalculations.calculateFlightsUsage(
        resultsInput.flightsUsageInput);
    int typesOfRecyclingScore = QuestionsCalculations.calculateRecyclingOptions(
        recyclingOptionsCheckboxes);

    int carbonFootprintResult = noOfPeopleInHomeScore +
        houseSizeScore +
        foodHabitsScore +
        packagingUseScore +
        washingMachineUsageScore +
        dishwasherUsageScore +
        newHouseholdPurchasesScore +
        wheelieBinsFilledScore +
        personalVehicleMilesScore +
        publicTransportMilesScore +
        flightMilesScore +
        typesOfRecyclingScore;

    String carbonFootprintRating =
        QuestionsCalculations.calculateRating(carbonFootprintResult);

    String improvementSuggestionsString =
        QuestionsCalculations.calculateImprovementSuggestions(
            improvementSuggestions);

    Results results = Results(
        1,
        carbonFootprintResult.toString(),
        loggedInUserId,
        carbonFootprintRating,
        resultsInput.numberOfPeopleInHomeInput,
        resultsInput.houseSizeInput,
        resultsInput.foodHabitsInput,
        resultsInput.foodPackagingInput,
        resultsInput.washingMachineInput,
        resultsInput.dishwasherInput,
        resultsInput.householdPurchasesInput,
        resultsInput.numberOfWheelieBinsFilledInput,
        getRecyclingOptionsAsString(recyclingOptionsCheckboxes),
        resultsInput.personalVehicleUsageInput,
        resultsInput.publicTransportUsageInput,
        resultsInput.flightsUsageInput,
        noOfPeopleInHomeScore,
        houseSizeScore,
        foodHabitsScore,
        packagingUseScore,
        washingMachineUsageScore,
        dishwasherUsageScore,
        newHouseholdPurchasesScore,
        wheelieBinsFilledScore,
        typesOfRecyclingScore,
        personalVehicleMilesScore,
        publicTransportMilesScore,
        flightMilesScore,
        0.0);

    //Calculate and update the carbon emissions value based on the inputs
    double carbonEmissionsValue = 
      QuestionsCalculations.calculateCarbonEmissionsValue(results);
    results.carbonEmissionsScore = carbonEmissionsValue;

    setState(() {
      result = 'Your carbon footprint score is $carbonFootprintResult \n';
      rating = 'Your carbon footprint rating is $carbonFootprintRating';
      improvementSuggestionsFormatted =
          'To improve your score and rating further, consider doing the following:\n'
          '$improvementSuggestionsString';
    });

    return results;
  }

  //!!!!!!!Move to the questions calculation clas???????
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
}
