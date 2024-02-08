class QuestionsValidators {
  //Private constructor to prevent instantiation
  QuestionsValidators._();

  static String? numberOfPeopleInHouseValidator(String? value) {
    return _checkForPositiveNumber(value);
  }

  static String? houseSizeValidator(String? value) {
    if (value == null ||
        value.isEmpty ||
        value == 'Please select your house size') {
      return 'Please select an option';
    }
    return null;
  }

  static String? foodHabitsValidator(String? value) {
       if (value == null ||
                        value.isEmpty ||
                        value == 'Please select your food habits') {
                      return 'Please select an option';
                    }
                    return null;
  }

  static String? foodPackagingUseValidator(String? value) {
    if (value == null ||
                        value.isEmpty ||
                        value == 'Please select your food packaging use') {
                      return 'Please select an option';
                    }
                    return null;
  }

  static String? washingMachineUsageValidator(String? value){
       if (value == null ||
                        value.isEmpty ||
                        value == 'How often do you use your washing machine?') {
                      return 'Please select an option';
                    }
                    return null;
  }

  static String? dishwasherUsageValidator(String? value){
       if (value == null ||
                        value.isEmpty ||
                        value == 'How often do you use your dishwasher?') {
                      return 'Please select an option';
                    }
                    return null;
  }

  static String? newHouseholdItemsValidator(String? value){
     if (value == null ||
                        value.isEmpty ||
                        value ==
                            'How many new household items do you buy per year?') {
                      return 'Please select an option';
                    }
                    return null;
  }

  static String? numberOfWheelieBinsFilledValidator(String? value){
     return _checkForPositiveNumber(value);
  }

  static String? personalVehicleMilageValidator(String? value){
    return _checkForPositiveNumber(value);
  }

  static String? publicTransportMilageValidator(String? value){
     return _checkForPositiveNumber(value);
  }

  static String? flightsPerYearValidator(String? value){ 
       if (value == null ||
                        value.isEmpty ||
                        value == 'Where have you taken flights this year?') {
                      return 'Please select an option';
                    }
                    return null;
  }

  static String? _checkForPositiveNumber(String? value){
    RegExp regexForPositiveInt = RegExp("^[1-9]+[0-9]*\$");
                      if (value == null ||
                          value.isEmpty ||
                          !regexForPositiveInt.hasMatch(value)) {
                        return 'Please enter a postive number';
                      }
                      return null;
  }
}
