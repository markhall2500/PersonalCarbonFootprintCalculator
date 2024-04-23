//This class stores the model for the values for the user input on the 
//carbon footprint questions page

class ResultsInput {
  int numberOfPeopleInHomeInput = 0;
  String houseSizeInput = '';
  String foodHabitsInput = '';
  String foodPackagingInput = '';
  String washingMachineInput = '';
  String dishwasherInput = '';
  String householdPurchasesInput = '';
  int numberOfWheelieBinsFilledInput = 0;
  int personalVehicleUsageInput = 0;
  int publicTransportUsageInput = 0;
  String flightsUsageInput = '';
  Map<String, bool?> recyclingOptionsCheckboxesInput = {};

  ResultsInput(
      this.numberOfPeopleInHomeInput,
      this.houseSizeInput,
      this.foodHabitsInput,
      this.foodPackagingInput,
      this.washingMachineInput,
      this.dishwasherInput,
      this.householdPurchasesInput,
      this.numberOfWheelieBinsFilledInput,
      this.personalVehicleUsageInput,
      this.publicTransportUsageInput,
      this.flightsUsageInput,
      this.recyclingOptionsCheckboxesInput);
}
