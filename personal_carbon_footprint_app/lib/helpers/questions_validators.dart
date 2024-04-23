//This class provides the validation checks for the fields on the carbon 
//footprint questions page

class QuestionsValidators {
  //Private constructor to prevent instantiation
  QuestionsValidators._();

  //Validation method for the number of people in the house form field
  static String? numberOfPeopleInHouseValidator(String? value) {
    return _checkForPositiveNumber(value);
  }

  //Validation method for the house size form field
  static String? houseSizeValidator(String? value) {
    if (value == null ||
        value.isEmpty ||
        value == 'House size') {
      return 'Please select an option';
    }
    return null;
  }

  //Validation method for the food habits form field
  static String? foodHabitsValidator(String? value) {
       if (value == null ||
                        value.isEmpty ||
                        value == 'Food habits') {
                      return 'Please select an option';
                    }
                    return null;
  }

  //Validation method for the food packaging use form field
  static String? foodPackagingUseValidator(String? value) {
    if (value == null ||
                        value.isEmpty ||
                        value == 'Food packaging usage') {
                      return 'Please select an option';
                    }
                    return null;
  }

  //Validation method for the washing machine form field
  static String? washingMachineUsageValidator(String? value){
       if (value == null ||
                        value.isEmpty ||
                        value == 'Washing machine usage') {
                      return 'Please select an option';
                    }
                    return null;
  }

  //Validation method for the dishwasher form field
  static String? dishwasherUsageValidator(String? value){
       if (value == null ||
                        value.isEmpty ||
                        value == 'Dishwasher usage') {
                      return 'Please select an option';
                    }
                    return null;
  }

  //Validation method for the new household items form field
  static String? newHouseholdItemsValidator(String? value){
     if (value == null ||
                        value.isEmpty ||
                        value ==
                            'New household items per year') {
                      return 'Please select an option';
                    }
                    return null;
  }

  //Validation method for the number of wheelie bins filled form field
  static String? numberOfWheelieBinsFilledValidator(String? value){
     return _checkForPositiveNumberIncludingZero(value);
  }

  //Validation method for the personal vehicle milage form field
  static String? personalVehicleMilageValidator(String? value){
    return _checkForPositiveNumberIncludingZero(value);
  }

  //Validation method for the public transport milage form field
  static String? publicTransportMilageValidator(String? value){
     return _checkForPositiveNumberIncludingZero(value);
  }

  //Validation method for the flights per year form field
  static String? flightsPerYearValidator(String? value){ 
       if (value == null ||
                        value.isEmpty ||
                        value == 'Flights this year') {
                      return 'Please select an option';
                    }
                    return null;
  }

  //Shared method to check for a positive number by the validator methods
  static String? _checkForPositiveNumber(String? value){
    RegExp regexForPositiveInt = RegExp("^[1-9]+[0-9]*\$");
                      if (value == null ||
                          value.isEmpty ||
                          !regexForPositiveInt.hasMatch(value)) {
                        return 'Please enter a postive number above 0';
                      }
                      return null;
  }

  //Shared method to check for a positive number by the validator methods (including 0)
  static String? _checkForPositiveNumberIncludingZero(String? value){
    RegExp regexForPositiveInt = RegExp("^[0-9]+[0-9]*\$");
                      if (value == null ||
                          value.isEmpty ||
                          !regexForPositiveInt.hasMatch(value)) {
                        return 'Please enter a postive number';
                      }
                      return null;
  }
}
