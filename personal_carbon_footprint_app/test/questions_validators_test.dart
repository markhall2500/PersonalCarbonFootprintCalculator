import 'package:flutter_test/flutter_test.dart';
import 'package:personal_carbon_footprint_app/helpers/questions_validators.dart';

//This class is checking that the validators are working correctly
//on the carbon footprint questions page when users are entering blank or
//invalid options 
void main() {
  group(
    'Number of people in house validator -',
    () {
      test('Null value provided', () {
        final result =
            QuestionsValidators.numberOfPeopleInHouseValidator(null);
        expect(result, 'Please enter a postive number above 0');
      });

      test('Empty value provided', () {
        final result =
            QuestionsValidators.numberOfPeopleInHouseValidator('');
        expect(result, 'Please enter a postive number above 0');
      });

      test('letter value provided', () {
        final result =
            QuestionsValidators.numberOfPeopleInHouseValidator('a');
        expect(result, 'Please enter a postive number above 0');
      });

      test('Negative number value provided', () {
        final result =
            QuestionsValidators.numberOfPeopleInHouseValidator('-1');
        expect(result, 'Please enter a postive number above 0');
      });

      test('Symbol value provided', () {
        final result =
            QuestionsValidators.numberOfPeopleInHouseValidator('%');
        expect(result, 'Please enter a postive number above 0');
      });

       test('Postive value provided', () {
        final result =
            QuestionsValidators.numberOfPeopleInHouseValidator('10');
        expect(result, null);
      });
    },
  );

  group(
    'House size validator -',
    () {
      test('Null value provided', () {
        final result =
            QuestionsValidators.houseSizeValidator(null);
        expect(result, 'Please select an option');
      });

      test('Empty value provided', () {
        final result =
            QuestionsValidators.houseSizeValidator('');
        expect(result, 'Please select an option');
      });

      test('value not selected by user', () {
        final result =
            QuestionsValidators.houseSizeValidator(
              'House size');
        expect(result, 'Please select an option');
      });

      test('value selected by user', () {
        final result =
            QuestionsValidators.houseSizeValidator('Large');
        expect(result, null);
      });
    },
  );

  group(
    'Food habits validator -',
    () {
      test('Null value provided', () {
        final result =
            QuestionsValidators.foodHabitsValidator(null);
        expect(result, 'Please select an option');
      });

      test('Empty value provided', () {
        final result =
            QuestionsValidators.foodHabitsValidator('');
        expect(result, 'Please select an option');
      });

      test('value not selected by user', () {
        final result =
            QuestionsValidators.foodHabitsValidator(
              'Food habits');
        expect(result, 'Please select an option');
      });

      test('value selected by user', () {
        final result =
            QuestionsValidators.foodHabitsValidator('Eat meat daily');
        expect(result, null);
      });
    },
  );

  group(
    'Food packaging validator -',
    () {
      test('Null value provided', () {
        final result =
            QuestionsValidators.foodPackagingUseValidator(null);
        expect(result, 'Please select an option');
      });

      test('Empty value provided', () {
        final result =
            QuestionsValidators.foodPackagingUseValidator('');
        expect(result, 'Please select an option');
      });

      test('value not selected by user', () {
        final result =
            QuestionsValidators.foodPackagingUseValidator(
              'Food packaging usage');
        expect(result, 'Please select an option');
      });

      test('value selected by user', () {
        final result =
            QuestionsValidators.foodPackagingUseValidator(
              'Mostly Prepackaged food');
        expect(result, null);
      });
    },
  );

  group(
    'Washing machine usage validator -',
    () {
      test('Null value provided', () {
        final result =
            QuestionsValidators.washingMachineUsageValidator(null);
        expect(result, 'Please select an option');
      });

      test('Empty value provided', () {
        final result =
            QuestionsValidators.washingMachineUsageValidator('');
        expect(result, 'Please select an option');
      });

      test('value not selected by user', () {
        final result =
            QuestionsValidators.washingMachineUsageValidator(
              'Washing machine usage');
        expect(result, 'Please select an option');
      });

      test('value selected by user', () {
        final result =
            QuestionsValidators.washingMachineUsageValidator(
              'More than 9 times per week');
        expect(result, null);
      });
    },
  );

  group(
    'Dishwasher usage validator -',
    () {
      test('Null value provided', () {
        final result =
            QuestionsValidators.dishwasherUsageValidator(null);
        expect(result, 'Please select an option');
      });

      test('Empty value provided', () {
        final result =
            QuestionsValidators.dishwasherUsageValidator('');
        expect(result, 'Please select an option');
      });

      test('value not selected by user', () {
        final result =
            QuestionsValidators.dishwasherUsageValidator(
              'Dishwasher usage');
        expect(result, 'Please select an option');
      });

      test('value selected by user', () {
        final result =
            QuestionsValidators.dishwasherUsageValidator(
              'More than 9 times per week');
        expect(result, null);
      });
    },
  );

  group(
    'Number of new household items per year validator -',
    () {
      test('Null value provided', () {
        final result =
            QuestionsValidators.newHouseholdItemsValidator(null);
        expect(result, 'Please select an option');
      });

      test('Empty value provided', () {
        final result =
            QuestionsValidators.newHouseholdItemsValidator('');
        expect(result, 'Please select an option');
      });

      test('value not selected by user', () {
        final result =
            QuestionsValidators.newHouseholdItemsValidator(
              'New household items per year');
        expect(result, 'Please select an option');
      });

      test('value selected by user', () {
        final result =
            QuestionsValidators.newHouseholdItemsValidator(
              'More than 7 new items');
        expect(result, null);
      });
    },
  );

  group(
    'Number of wheelie bins filled validator -',
    () {
      test('Null value provided', () {
        final result =
            QuestionsValidators.numberOfWheelieBinsFilledValidator(null);
        expect(result, 'Please enter a postive number');
      });

      test('Empty value provided', () {
        final result =
            QuestionsValidators.numberOfWheelieBinsFilledValidator('');
        expect(result, 'Please enter a postive number');
      });

      test('letter value provided', () {
        final result =
            QuestionsValidators.numberOfWheelieBinsFilledValidator('a');
        expect(result, 'Please enter a postive number');
      });

      test('Negative number value provided', () {
        final result =
            QuestionsValidators.numberOfWheelieBinsFilledValidator('-1');
        expect(result, 'Please enter a postive number');
      });

      test('Symbol value provided', () {
        final result =
            QuestionsValidators.numberOfWheelieBinsFilledValidator('%');
        expect(result, 'Please enter a postive number');
      });

       test('Postive value provided', () {
        final result =
            QuestionsValidators.numberOfWheelieBinsFilledValidator('4');
        expect(result, null);
      });
    },
  );

  group(
    'Personal vehicle milage validator -',
    () {
      test('Null value provided', () {
        final result =
            QuestionsValidators.personalVehicleMilageValidator(null);
        expect(result, 'Please enter a postive number');
      });

      test('Empty value provided', () {
        final result =
            QuestionsValidators.personalVehicleMilageValidator('');
        expect(result, 'Please enter a postive number');
      });

      test('letter value provided', () {
        final result =
            QuestionsValidators.personalVehicleMilageValidator('a');
        expect(result, 'Please enter a postive number');
      });

      test('Negative number value provided', () {
        final result =
            QuestionsValidators.personalVehicleMilageValidator('-1');
        expect(result, 'Please enter a postive number');
      });

      test('Symbol value provided', () {
        final result =
            QuestionsValidators.personalVehicleMilageValidator('%');
        expect(result, 'Please enter a postive number');
      });

       test('Postive value provided', () {
        final result =
            QuestionsValidators.personalVehicleMilageValidator('10000');
        expect(result, null);
      });
    },
  );

  group(
    'Public transport vehicle validator -',
    () {
      test('Null value provided', () {
        final result =
            QuestionsValidators.publicTransportMilageValidator(null);
        expect(result, 'Please enter a postive number');
      });

      test('Empty value provided', () {
        final result =
            QuestionsValidators.publicTransportMilageValidator('');
        expect(result, 'Please enter a postive number');
      });

      test('letter value provided', () {
        final result =
            QuestionsValidators.publicTransportMilageValidator('a');
        expect(result, 'Please enter a postive number');
      });

      test('Negative number value provided', () {
        final result =
            QuestionsValidators.publicTransportMilageValidator('-1');
        expect(result, 'Please enter a postive number');
      });

      test('Symbol value provided', () {
        final result =
            QuestionsValidators.publicTransportMilageValidator('%');
        expect(result, 'Please enter a postive number');
      });

       test('Postive value provided', () {
        final result =
            QuestionsValidators.publicTransportMilageValidator('20000');
        expect(result, null);
      });
    },
  );
}