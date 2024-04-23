import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_carbon_footprint_app/data/results.dart';
import 'package:personal_carbon_footprint_app/data/results_input.dart';
import 'package:personal_carbon_footprint_app/data/sp_helper.dart';
import 'package:personal_carbon_footprint_app/helpers/questions_calculations.dart';
import 'package:personal_carbon_footprint_app/helpers/questions_previous_results.dart';
import 'package:personal_carbon_footprint_app/helpers/questions_validators.dart';
import 'package:personal_carbon_footprint_app/shared/globals.dart';
import 'package:personal_carbon_footprint_app/shared/menu_drawer.dart';
import '../shared/menu_bottom.dart';

//This class generates the screen which contains the questions for the
//calculating the users personal carbon footprint
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
  SPHelper helper = SPHelper();

  //Text editing controlling variables for the text field questions
  TextEditingController txtNumberOfPeopleInHome = TextEditingController();
  TextEditingController txtNumberOfWheelieBinsFilled = TextEditingController();
  TextEditingController txtPersonalVehicleUsage = TextEditingController();
  TextEditingController txtPublicTransportUsage = TextEditingController();

  //variables for the fontsize and results variables
  final double fontSize = 16;
  String result = '';
  RichText rating = RichText(
    text: const TextSpan(
      text: '',
      children: <TextSpan>[
        TextSpan(text: ''),
      ],
    ),
  );

  String improvementSuggestionsFormatted = '';
  Widget? animation;

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
    'Mostly Prepackaged food',
    'Prepackaged and fresh food',
    'Only fresh food items'
  ];
  String? selectedFoodPackaging;

  //Variables for washing machine usage choices
  List<String> washingMachineUsageDropDown = [
    'More than 9 times per week',
    '4-9 times per week',
    '1-3 times per week',
    'No washing machine'
  ];
  String? selectedWashingMachineUsage;

  //Variables for dishwasher usage choices
  List<String> dishwasherUsageDropDown = [
    'More than 9 times per week',
    '4-9 times per week',
    '1-3 times per week',
    'No dishwasher'
  ];
  String? selectedDishwasherUsage;

  //Variables for dishwasher usage choices
  List<String> householdPurchasesDropDown = [
    'More than 7 new items',
    '5-7 new items',
    '3-5 new items',
    'Less than 3 items',
    'Almost nothing or second hand'
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

  var isPreviousRecyclingGlassResultSet = false;
  var isPreviousRecyclingPlasticResultSet = false;
  var isPreviousRecyclingPaperResultSet = false;
  var isPreviousRecyclingAluminumResultSet = false;
  var isPreviousRecyclingSteelResultSet = false;
  var isPreviousRecyclingFoodWasteResultSet = false;

  @override
  Widget build(BuildContext context) {
    numberOfPeopleInHomeMessage = 'Number of people in your house';
    numberOfWheelieBinsFilledMessage =
        'Black wheelie bins filled weekly';
    personalVehicleUsageMessage = 'Miles per year in personal vehicle';
    publicTransportUsageMessage = 'Miles per year on public transport';

    //Check for previous results to populate the fields
    var latestNumberOfPeopleInHomeResults =
        QuestionsPreviousResults.numberOfPeopleInHousePreviousResult(
            helper.getResultsForLoggedInUser());
    if (latestNumberOfPeopleInHomeResults != null &&
        txtNumberOfPeopleInHome.text.isEmpty) {
      txtNumberOfPeopleInHome =
          TextEditingController(text: latestNumberOfPeopleInHomeResults);
    }

    var latestHouseSizeResults =
        QuestionsPreviousResults.houseSizePreviousResult(
            helper.getResultsForLoggedInUser());
    if (latestHouseSizeResults != null && selectedSizeOfHouse == null) {
      selectedSizeOfHouse = latestHouseSizeResults;
    }

    var latestFoodHabitsResults =
        QuestionsPreviousResults.foodHabitsPreviousResult(
            helper.getResultsForLoggedInUser());
    if (latestFoodHabitsResults != null && selectedFoodHabits == null) {
      selectedFoodHabits = latestFoodHabitsResults;
    }

    var latestFoodPackagingUseResults =
        QuestionsPreviousResults.foodPackagingPreviousResult(
            helper.getResultsForLoggedInUser());
    if (latestFoodPackagingUseResults != null &&
        selectedFoodPackaging == null) {
      selectedFoodPackaging = latestFoodPackagingUseResults;
    }

    var latestWashingMachineResults =
        QuestionsPreviousResults.washingMachinePreviousResult(
            helper.getResultsForLoggedInUser());
    if (latestWashingMachineResults != null &&
        selectedWashingMachineUsage == null) {
      selectedWashingMachineUsage = latestWashingMachineResults;
    }

    var latestDishwasherResults =
        QuestionsPreviousResults.dishwasherPreviousResult(
            helper.getResultsForLoggedInUser());
    if (latestDishwasherResults != null && selectedDishwasherUsage == null) {
      selectedDishwasherUsage = latestDishwasherResults;
    }

    var latestNewHouseholdPurchasesResults =
        QuestionsPreviousResults.newHouseholdItemsPreviousResult(
            helper.getResultsForLoggedInUser());
    if (latestNewHouseholdPurchasesResults != null &&
        selectedHouseholdPurchases == null) {
      selectedHouseholdPurchases = latestNewHouseholdPurchasesResults;
    }

    var latestWheelieBinResults =
        QuestionsPreviousResults.wheelieBinsPreviousResult(
            helper.getResultsForLoggedInUser());
    if (latestWheelieBinResults != null &&
        txtNumberOfWheelieBinsFilled.text.isEmpty) {
      txtNumberOfWheelieBinsFilled =
          TextEditingController(text: latestWheelieBinResults);
    }

    if (!isPreviousRecyclingGlassResultSet) {
      var latestTypesOfRecyclingPreviousResult =
          QuestionsPreviousResults.typesOfRecyclingPreviousResult(
              helper.getResultsForLoggedInUser());
      recyclingOptionsCheckboxes['Glass'] =
          latestTypesOfRecyclingPreviousResult[0];
      isPreviousRecyclingGlassResultSet = true;
    }

    if (!isPreviousRecyclingPlasticResultSet) {
      var latestTypesOfRecyclingPreviousResult =
          QuestionsPreviousResults.typesOfRecyclingPreviousResult(
              helper.getResultsForLoggedInUser());
      recyclingOptionsCheckboxes['Plastic'] =
          latestTypesOfRecyclingPreviousResult[1];
      isPreviousRecyclingPlasticResultSet = true;
    }

    if (!isPreviousRecyclingPaperResultSet) {
      var latestTypesOfRecyclingPreviousResult =
          QuestionsPreviousResults.typesOfRecyclingPreviousResult(
              helper.getResultsForLoggedInUser());
      recyclingOptionsCheckboxes['Paper'] =
          latestTypesOfRecyclingPreviousResult[2];
      isPreviousRecyclingPaperResultSet = true;
    }

    if (!isPreviousRecyclingAluminumResultSet) {
      var latestTypesOfRecyclingPreviousResult =
          QuestionsPreviousResults.typesOfRecyclingPreviousResult(
              helper.getResultsForLoggedInUser());
      recyclingOptionsCheckboxes['Aluminum'] =
          latestTypesOfRecyclingPreviousResult[3];
      isPreviousRecyclingAluminumResultSet = true;
    }

    if (!isPreviousRecyclingSteelResultSet) {
      var latestTypesOfRecyclingPreviousResult =
          QuestionsPreviousResults.typesOfRecyclingPreviousResult(
              helper.getResultsForLoggedInUser());
      recyclingOptionsCheckboxes['Steel'] =
          latestTypesOfRecyclingPreviousResult[4];
      isPreviousRecyclingSteelResultSet = true;
    }

    if (!isPreviousRecyclingFoodWasteResultSet) {
      var latestTypesOfRecyclingPreviousResult =
          QuestionsPreviousResults.typesOfRecyclingPreviousResult(
              helper.getResultsForLoggedInUser());
      recyclingOptionsCheckboxes['Food waste'] =
          latestTypesOfRecyclingPreviousResult[5];
      isPreviousRecyclingFoodWasteResultSet = true;
    }

    var latestPersonalVehicleMilesResults =
        QuestionsPreviousResults.personalVehicleMilesPreviousResult(
            helper.getResultsForLoggedInUser());
    if (latestPersonalVehicleMilesResults != null &&
        txtPersonalVehicleUsage.text.isEmpty) {
      txtPersonalVehicleUsage =
          TextEditingController(text: latestPersonalVehicleMilesResults);
    }

    var latestPublicTransportMilesResults =
        QuestionsPreviousResults.publicTransportMilesPreviousResult(
            helper.getResultsForLoggedInUser());
    if (latestPublicTransportMilesResults != null &&
        txtPublicTransportUsage.text.isEmpty) {
      txtPublicTransportUsage =
          TextEditingController(text: latestPublicTransportMilesResults);
    }

    var latestflightsUsageResults =
        QuestionsPreviousResults.flightsMilesPreviousResult(
            helper.getResultsForLoggedInUser());
    if (latestflightsUsageResults != null && selectedFlightsUsage == null) {
      selectedFlightsUsage = latestflightsUsageResults;
    }

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
              Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    'Carbon Footprint Questions',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        shadows: [globalShadowText()]),
                  )),
              //Description for the page including colour for rating text
              Center(
                child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 32.0, right: 32.0, bottom: 20.0),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white38,
                      ),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text:
                                    'Complete the questions below to calculate your personal carbon footprint. When complete, you wil recieve a rating of ',
                                style:
                                    TextStyle(color : Colors.black, shadows: [globalShadowText()])),
                            TextSpan(
                                text: 'Bronze',
                                style: TextStyle(
                                    color: const Color.fromRGBO(
                                        194, 121, 4, 0.996),
                                    shadows: [globalShadowText()])),
                            const TextSpan(text: ' / '),
                            TextSpan(
                                text: 'Silver',
                                style: TextStyle(
                                    color:
                                        const Color.fromRGBO(76, 77, 77, 0.914),
                                    shadows: [globalShadowText()])),
                            const TextSpan(
                                text: ' / ', 
                                style: TextStyle(color : Colors.black)),
                            TextSpan(
                                text: 'Gold',
                                style: TextStyle(
                                    color: const Color.fromRGBO(225, 183, 0, 1),
                                    shadows: [globalShadowText()])),
                            const TextSpan(
                              text: ' / ',
                              style: TextStyle(color : Colors.black)),
                            TextSpan(
                                text: 'Platinum',
                                style: TextStyle(
                                    color: const Color.fromRGBO(
                                        13, 205, 176, 0.601),
                                    shadows: [globalShadowText()])),
                            const TextSpan(
                              text: ' / ',
                              style: TextStyle(color : Colors.black)),
                            TextSpan(
                                text: 'Diamond',
                                style: TextStyle(
                                    color:
                                        const Color.fromRGBO(4, 17, 158, 0.478),
                                    shadows: [globalShadowText()])),
                          ])),
                    )),
              ),
              //Question for number of people in the home
              Padding(
                padding:
                    const EdgeInsets.only(top: 12.0, left: 32.0, right: 32.0),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white38,
                  ),
                  child: TextFormField(
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize,
                          shadows: [globalShadowText()]),
                      controller: txtNumberOfPeopleInHome,
                      decoration: InputDecoration(
                          hintText: numberOfPeopleInHomeMessage),
                      validator: (value) {
                        return QuestionsValidators
                            .numberOfPeopleInHouseValidator(value);
                      },
                      keyboardType: TextInputType.number),
                ),
              ),
              //Questions for the house size
              Padding(
                padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white38,
                  ),
                  child: DropdownButtonFormField(
                    validator: (value) {
                      return QuestionsValidators.houseSizeValidator(value);
                    },
                    style: TextStyle(
                        color : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize,
                        shadows: [globalShadowText()]),
                    hint: const Text('House size'),
                    value: latestHouseSizeResults,
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
              ),
              //Question for food habits
              Padding(
                padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white38,
                  ),
                  child: DropdownButtonFormField(
                    validator: (value) {
                      return QuestionsValidators.foodHabitsValidator(value);
                    },
                    style: TextStyle(
                        color : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize,
                        shadows: [globalShadowText()]),
                    hint: const Text('Food habits'),
                    value: latestFoodHabitsResults,
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
              ),
              //Question for food packaging usage
              Padding(
                padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white38,
                  ),
                  child: DropdownButtonFormField(
                    validator: (value) {
                      return QuestionsValidators.foodPackagingUseValidator(
                          value);
                    },
                    style: TextStyle(
                        color : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize,
                        shadows: [globalShadowText()]),
                    hint: const Text('Food packaging usage'),
                    value: latestFoodPackagingUseResults,
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
              ),
              //Question for washing machine usage
              Padding(
                padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white38,
                  ),
                  child: DropdownButtonFormField(
                    validator: (value) {
                      return QuestionsValidators.washingMachineUsageValidator(
                          value);
                    },
                    style: TextStyle(
                        color : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize,
                        shadows: [globalShadowText()]),
                    hint: const Text('Washing machine usage'),
                    value: latestWashingMachineResults,
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
              ),
              //Questions for dishwasher usage
              Padding(
                padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white38,
                  ),
                  child: DropdownButtonFormField(
                    validator: (value) {
                      return QuestionsValidators.dishwasherUsageValidator(
                          value);
                    },
                    style: TextStyle(
                        color : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize,
                        shadows: [globalShadowText()]),
                    hint: const Text('Dishwasher usage'),
                    value: latestDishwasherResults,
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
              ),
              //Question for new household items
              Padding(
                padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white38,
                  ),
                  child: DropdownButtonFormField(
                    validator: (value) {
                      return QuestionsValidators.newHouseholdItemsValidator(
                          value);
                    },
                    style: TextStyle(
                        color : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize,
                        shadows: [globalShadowText()]),
                    hint: const Text('New household items per year'),
                    value: latestNewHouseholdPurchasesResults,
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
              ),
              //Question for number of wheelie bins filles
              Padding(
                padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white38,
                  ),
                  child: TextFormField(
                      style: TextStyle(
                          color : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize,
                          shadows: [globalShadowText()]),
                      controller: txtNumberOfWheelieBinsFilled,
                      decoration: InputDecoration(
                          hintText: numberOfWheelieBinsFilledMessage),
                      validator: (value) {
                        return QuestionsValidators
                            .numberOfWheelieBinsFilledValidator(value);
                      },
                      keyboardType: TextInputType.number),
                ),
              ),
              //Header and question for types of waste recycled
              Padding(
                  padding:
                      const EdgeInsets.only(top: 12.0, left: 32.0, right: 32.0),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white38,
                    ),
                    child: Text(
                      'Which types of waste do you recycle',
                      style: TextStyle(
                          color : Colors.black,
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                          shadows: [globalShadowText()]),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white38,
                  ),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          CheckboxListTile(
                              title: Text(
                                'Glass',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: fontSize,
                                    shadows: [globalShadowText()]),
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
                                    fontSize: fontSize,
                                    shadows: [globalShadowText()]),
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
                                    fontSize: fontSize,
                                    shadows: [globalShadowText()]),
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
                                    fontSize: fontSize,
                                    shadows: [globalShadowText()]),
                              ),
                              value: recyclingOptionsCheckboxes['Aluminum'],
                              onChanged: (bool? value) {
                                setState(() {
                                  recyclingOptionsCheckboxes['Aluminum'] =
                                      value;
                                });
                              }),
                          CheckboxListTile(
                              title: Text(
                                'Steel',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: fontSize,
                                    shadows: [globalShadowText()]),
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
                                    fontSize: fontSize,
                                    shadows: [globalShadowText()]),
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
              ),
              //Question for personal vehicle usage
              Padding(
                padding:
                    const EdgeInsets.only(top: 12.0, left: 32.0, right: 32.0),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white38,
                  ),
                  child: TextFormField(
                      style: TextStyle(
                          color : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize,
                          shadows: [globalShadowText()]),
                      controller: txtPersonalVehicleUsage,
                      decoration: InputDecoration(
                          hintText: personalVehicleUsageMessage),
                      validator: (value) {
                        return QuestionsValidators
                            .personalVehicleMilageValidator(value);
                      },
                      keyboardType: TextInputType.number),
                ),
              ),
              //Question for public transport usage
              Padding(
                padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white38,
                  ),
                  child: TextFormField(
                      style: TextStyle(
                          color : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize,
                          shadows: [globalShadowText()]),
                      controller: txtPublicTransportUsage,
                      decoration: InputDecoration(
                          hintText: publicTransportUsageMessage),
                      validator: (value) {
                        return QuestionsValidators
                            .publicTransportMilageValidator(value);
                      },
                      keyboardType: TextInputType.number),
                ),
              ),
              //Question for flights per year
              Padding(
                padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white38,
                  ),
                  child: DropdownButtonFormField(
                    validator: (value) {
                      return QuestionsValidators.flightsPerYearValidator(value);
                    },
                    style: TextStyle(
                        fontSize: fontSize,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        shadows: [globalShadowText()]),
                    hint: const Text('Flights this year'),
                    value: QuestionsPreviousResults.flightsMilesPreviousResult(
                        helper.getResultsForLoggedInUser()),
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
              ),
              //Form submission
              Padding(
                padding:
                    const EdgeInsets.only(top: 42.0, left: 32.0, right: 32.0),
                child: ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        Results result = calculateCarbonFootprint();
                        DateTime now = DateTime.now();
                        String timestamp = DateFormat("dd/MM/yyyy  HH:mm:ss")
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
                        style: TextStyle(
                            fontSize: fontSize,
                            shadows: [globalShadowText()]))),
              ),
              //Result text
              Padding(
                padding:
                    const EdgeInsets.only(top: 25.0, left: 32.0, right: 32.0),
                child: Text(
                  result,
                  style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      shadows: [globalShadowText()]),
                ),
              ),
              //Rating text
              Padding(
                padding:
                    const EdgeInsets.only(top: 5.0, left: 32.0, right: 32.0),
                child: Container(child: rating),
              ),
              //Rating animation
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 32.0, right: 32.0),
                child: animation,
              ),
              //Improvement suggestions
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 32.0, right: 32.0),
                child: Text(
                  improvementSuggestionsFormatted,
                  style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      shadows: [globalShadowText()]),
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
        QuestionsCalculations.getRecyclingOptionsAsString(
            recyclingOptionsCheckboxes),
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
      animation = QuestionsCalculations.getAnimation(carbonFootprintRating);
      result = 'Your carbon footprint score is $carbonFootprintResult \n';
      rating = RichText(
          text: TextSpan(children: <TextSpan>[
        TextSpan(
            text: 'Your carbon footprint rating is ',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
                shadows: [globalShadowText()])),
        TextSpan(
            text: carbonFootprintRating,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
                color: QuestionsCalculations.getColourFromRating(
                    carbonFootprintRating),
                shadows: [globalShadowText()])),
      ]));
      improvementSuggestionsFormatted =
          'To improve your score and rating further, consider doing the following:\n'
          '$improvementSuggestionsString';
    });

    return results;
  }
}
