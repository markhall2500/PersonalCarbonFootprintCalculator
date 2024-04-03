import 'package:flutter_test/flutter_test.dart';
import 'package:personal_carbon_footprint_app/data/results.dart';
import 'package:personal_carbon_footprint_app/helpers/questions_calculations.dart';

void main() {
  group(
    'Number of people in home form field -',
    () {
      test('1 person in the home returns 14 points', () {
        final result =
            QuestionsCalculations.calculatePointsForNumberOfPeopleInHome(1);
        expect(result, 14);
      });

      test('2 people in the home returns 12 points', () {
        final result =
            QuestionsCalculations.calculatePointsForNumberOfPeopleInHome(2);
        expect(result, 12);
      });

      test('3 people in the home returns 10 points', () {
        final result =
            QuestionsCalculations.calculatePointsForNumberOfPeopleInHome(3);
        expect(result, 10);
      });

      test('4 people in the home returns 8 points', () {
        final result =
            QuestionsCalculations.calculatePointsForNumberOfPeopleInHome(4);
        expect(result, 8);
      });

      test('5 people in the home returns 6 points', () {
        final result =
            QuestionsCalculations.calculatePointsForNumberOfPeopleInHome(5);
        expect(result, 6);
      });

      test('6 people in the home returns 4 points', () {
        final result =
            QuestionsCalculations.calculatePointsForNumberOfPeopleInHome(6);
        expect(result, 4);
      });

      test('7 people in the home returns 2 points', () {
        final result =
            QuestionsCalculations.calculatePointsForNumberOfPeopleInHome(7);
        expect(result, 2);
      });
    },
  );

  group(
    'House size form field -',
    () {
      test('Large house returns 10 points', () {
        final result = QuestionsCalculations.calculateHouseSize('Large');
        expect(result, 10);
      });

      test('Medium house returns 7 points', () {
        final result = QuestionsCalculations.calculateHouseSize('Medium');
        expect(result, 7);
      });

      test('Small house returns 4 points', () {
        final result = QuestionsCalculations.calculateHouseSize('Small');
        expect(result, 4);
      });

      test('Apartment returns 2 points', () {
        final result = QuestionsCalculations.calculateHouseSize('Apartment');
        expect(result, 2);
      });
    },
  );

  group(
    'Food habits form field -',
    () {
      test('Eat meat daily returns 10 points', () {
        final result =
            QuestionsCalculations.calculateFoodHabits('Eat meat daily');
        expect(result, 10);
      });

      test('Eat meat a few times a week returns 8 points', () {
        final result = QuestionsCalculations.calculateFoodHabits(
            'Eat meat a few times a week');
        expect(result, 8);
      });

      test('Vegetarian returns 4 points', () {
        final result = QuestionsCalculations.calculateFoodHabits('Vegetarian');
        expect(result, 4);
      });

      test('Vegan returns 2 points', () {
        final result = QuestionsCalculations.calculateFoodHabits('Vegan');
        expect(result, 2);
      });
    },
  );

  group(
    'Food packaging form field -',
    () {
      test('Mostly Prepackaged convienience food items returns 12 points', () {
        final result = QuestionsCalculations.calculateFoodPackaging(
            'Mostly Prepackaged convienience food items');
        expect(result, 12);
      });

      test('Balance of prepackaged and fresh food items returns 6 points', () {
        final result = QuestionsCalculations.calculateFoodPackaging(
            'Balance of prepackaged and fresh food items');
        expect(result, 6);
      });

      test('Only fresh food items returns 2 points', () {
        final result = QuestionsCalculations.calculateFoodPackaging(
            'Only fresh food items');
        expect(result, 2);
      });
    },
  );

  group(
    'Washing Machine usage form field -',
    () {
      test('More than 9 times per week returns 3 points', () {
        final result = QuestionsCalculations.calculateWashingMachine(
            'More than 9 times per week');
        expect(result, 3);
      });

      test('4-9 times per week returns 2 points', () {
        final result =
            QuestionsCalculations.calculateWashingMachine('4-9 times per week');
        expect(result, 2);
      });

      test('1-3 times per week returns 1 points', () {
        final result =
            QuestionsCalculations.calculateWashingMachine('1-3 times per week');
        expect(result, 1);
      });

      test('I do not own a washing machine returns 0 points', () {
        final result = QuestionsCalculations.calculateWashingMachine(
            'I do not own a washing machine');
        expect(result, 0);
      });
    },
  );

  group(
    'Dishwasher usage form field -',
    () {
      test('More than 9 times per week returns 3 points', () {
        final result = QuestionsCalculations.calculateDishwasher(
            'More than 9 times per week');
        expect(result, 3);
      });

      test('4-9 times per week returns 2 points', () {
        final result =
            QuestionsCalculations.calculateDishwasher('4-9 times per week');
        expect(result, 2);
      });

      test('1-3 times per week returns 1 points', () {
        final result =
            QuestionsCalculations.calculateDishwasher('1-3 times per week');
        expect(result, 1);
      });

      test('I do not own a washing machine returns 0 points', () {
        final result = QuestionsCalculations.calculateDishwasher(
            'I do not own a washing machine');
        expect(result, 0);
      });
    },
  );

  group(
    'Household purchases form field -',
    () {
      test('More than 7 new items per week returns 10 points', () {
        final result = QuestionsCalculations.calculateHouseholdPurchases(
            'More than 7 new items');
        expect(result, 10);
      });

      test('5-7 new items per week returns 8 points', () {
        final result =
            QuestionsCalculations.calculateHouseholdPurchases('5-7 new items');
        expect(result, 8);
      });

      test('3-5 new items per week returns 6 points', () {
        final result =
            QuestionsCalculations.calculateHouseholdPurchases('3-5 new items');
        expect(result, 6);
      });

      test('Less than 3 items returns 4 points', () {
        final result = QuestionsCalculations.calculateHouseholdPurchases(
            'Less than 3 items');
        expect(result, 4);
      });

      test('Almost nothing or second hand only returns 2 points', () {
        final result = QuestionsCalculations.calculateHouseholdPurchases(
            'Almost nothing or second hand only');
        expect(result, 2);
      });
    },
  );

  group(
    'Number of non-recycling wheelie bins filled form field -',
    () {
      test('0 wheelie bins filled returns 5 points', () {
        final result =
            QuestionsCalculations.calculateNumberOfWheelieBinsFilled(0);
        expect(result, 5);
      });

      test('1 wheelie bins filled returns 20 points', () {
        final result =
            QuestionsCalculations.calculateNumberOfWheelieBinsFilled(1);
        expect(result, 20);
      });

      test('2 wheelie bins filled returns 30 points', () {
        final result =
            QuestionsCalculations.calculateNumberOfWheelieBinsFilled(2);
        expect(result, 30);
      });

      test('3 wheelie bins filled returns 40 points', () {
        final result =
            QuestionsCalculations.calculateNumberOfWheelieBinsFilled(3);
        expect(result, 40);
      });

      test('4 wheelie bins filled returns 50 points', () {
        final result =
            QuestionsCalculations.calculateNumberOfWheelieBinsFilled(4);
        expect(result, 50);
      });
    },
  );

  group(
    'Personal vehicle usage form field -',
    () {
      test('Over 15000 miles travelled returns 12 points', () {
        final result =
            QuestionsCalculations.calculatePersonalVehicleUsage(15001);
        expect(result, 12);
      });

      test('15000 miles travelled returns 10 points', () {
        final result =
            QuestionsCalculations.calculatePersonalVehicleUsage(15000);
        expect(result, 10);
      });

      test('10001 miles travelled returns 10 points', () {
        final result =
            QuestionsCalculations.calculatePersonalVehicleUsage(10001);
        expect(result, 10);
      });

      test('10000 miles travelled returns 6 points', () {
        final result =
            QuestionsCalculations.calculatePersonalVehicleUsage(10000);
        expect(result, 6);
      });

      test('1001 miles travelled returns 6 points', () {
        final result =
            QuestionsCalculations.calculatePersonalVehicleUsage(1001);
        expect(result, 6);
      });

      test('1000 miles travelled returns 4 points', () {
        final result =
            QuestionsCalculations.calculatePersonalVehicleUsage(1000);
        expect(result, 4);
      });

      test('1 mile travelled returns 4 points', () {
        final result = QuestionsCalculations.calculatePersonalVehicleUsage(1);
        expect(result, 4);
      });

      test('0 miles travelled returns 0 points', () {
        final result = QuestionsCalculations.calculatePersonalVehicleUsage(0);
        expect(result, 0);
      });
    },
  );

  group(
    'public transport usage form field -',
    () {
      test('Over 20000 miles travelled returns 12 points', () {
        final result =
            QuestionsCalculations.calculatePublicTransportUsage(20001);
        expect(result, 12);
      });

      test('20000 miles travelled returns 10 points', () {
        final result =
            QuestionsCalculations.calculatePublicTransportUsage(20000);
        expect(result, 10);
      });

      test('15001 miles travelled returns 10 points', () {
        final result =
            QuestionsCalculations.calculatePublicTransportUsage(15001);
        expect(result, 10);
      });

      test('15000 miles travelled returns 6 points', () {
        final result =
            QuestionsCalculations.calculatePublicTransportUsage(15000);
        expect(result, 6);
      });

      test('10001 miles travelled returns 6 points', () {
        final result =
            QuestionsCalculations.calculatePublicTransportUsage(10001);
        expect(result, 6);
      });

      test('10000 miles travelled returns 4 points', () {
        final result =
            QuestionsCalculations.calculatePublicTransportUsage(10000);
        expect(result, 4);
      });

      test('1001 mile travelled returns 4 points', () {
        final result =
            QuestionsCalculations.calculatePublicTransportUsage(1001);
        expect(result, 4);
      });

      test('1000 miles travelled returns 2 points', () {
        final result =
            QuestionsCalculations.calculatePublicTransportUsage(1000);
        expect(result, 2);
      });

      test('1 mile travelled returns 2 points', () {
        final result = QuestionsCalculations.calculatePublicTransportUsage(1);
        expect(result, 2);
      });

      test('0 miles travelled returns 0 points', () {
        final result = QuestionsCalculations.calculatePublicTransportUsage(0);
        expect(result, 0);
      });
    },
  );

  group(
    'Filghts usage form field -',
    () {
      test('Worldwide returns 3 points', () {
        final result = QuestionsCalculations.calculateFlightsUsage('Worldwide');
        expect(result, 3);
      });

      test('Only within Europe returns 2 points', () {
        final result =
            QuestionsCalculations.calculateFlightsUsage('Only within Europe');
        expect(result, 2);
      });

      test('Only within the UK returns 1 points', () {
        final result =
            QuestionsCalculations.calculateFlightsUsage('Only within the UK');
        expect(result, 1);
      });

      test('No flights returns 0 points', () {
        final result =
            QuestionsCalculations.calculateFlightsUsage('No flights');
        expect(result, 0);
      });
    },
  );

  group(
    'Recycling options form field -',
    () {
      test('All types selected returns 0 points', () {
        Map<String, bool> testData = {
          'Glass': true,
          'Plastic': true,
          'Paper': true,
          'Aluminum': true,
          'Steel': true,
          'Food waste': true
        };
        final result =
            QuestionsCalculations.calculateRecyclingOptions(testData);
        expect(result, 0);
      });

      test('Glass only returns 20 points', () {
        Map<String, bool> testData = {
          'Glass': true,
          'Plastic': false,
          'Paper': false,
          'Aluminum': false,
          'Steel': false,
          'Food waste': false
        };
        final result =
            QuestionsCalculations.calculateRecyclingOptions(testData);
        expect(result, 20);
      });

      test('Plastic only returns 20 points', () {
        Map<String, bool> testData = {
          'Glass': false,
          'Plastic': true,
          'Paper': false,
          'Aluminum': false,
          'Steel': false,
          'Food waste': false
        };
        final result =
            QuestionsCalculations.calculateRecyclingOptions(testData);
        expect(result, 20);
      });

      test('Paper only returns 20 points', () {
        Map<String, bool> testData = {
          'Glass': false,
          'Plastic': false,
          'Paper': true,
          'Aluminum': false,
          'Steel': false,
          'Food waste': false
        };
        final result =
            QuestionsCalculations.calculateRecyclingOptions(testData);
        expect(result, 20);
      });

      test('Aluminum only returns 20 points', () {
        Map<String, bool> testData = {
          'Glass': false,
          'Plastic': false,
          'Paper': false,
          'Aluminum': true,
          'Steel': false,
          'Food waste': false
        };
        final result =
            QuestionsCalculations.calculateRecyclingOptions(testData);
        expect(result, 20);
      });

      test('Steel only returns 20 points', () {
        Map<String, bool> testData = {
          'Glass': false,
          'Plastic': false,
          'Paper': false,
          'Aluminum': false,
          'Steel': true,
          'Food waste': false
        };
        final result =
            QuestionsCalculations.calculateRecyclingOptions(testData);
        expect(result, 20);
      });

      test('Food waste only returns 20 points', () {
        Map<String, bool> testData = {
          'Glass': false,
          'Plastic': false,
          'Paper': false,
          'Aluminum': false,
          'Steel': false,
          'Food waste': true
        };
        final result =
            QuestionsCalculations.calculateRecyclingOptions(testData);
        expect(result, 20);
      });

      test('No reycling options only returns 24 points', () {
        Map<String, bool> testData = {
          'Glass': false,
          'Plastic': false,
          'Paper': false,
          'Aluminum': false,
          'Steel': false,
          'Food waste': false
        };
        final result =
            QuestionsCalculations.calculateRecyclingOptions(testData);
        expect(result, 24);
      });
    },
  );

  group(
    'Rating form label -',
    () {
      test('Less than 40 returns Diamond', () {
        final result = QuestionsCalculations.calculateRating(39);
        expect(result, 'Diamond');
      });

      test('40 returns Platinum', () {
        final result = QuestionsCalculations.calculateRating(40);
        expect(result, 'Platinum');
      });

      test('54 returns Platinum', () {
        final result = QuestionsCalculations.calculateRating(54);
        expect(result, 'Platinum');
      });

      test('55 returns Gold', () {
        final result = QuestionsCalculations.calculateRating(55);
        expect(result, 'Gold');
      });

      test('69 returns Gold', () {
        final result = QuestionsCalculations.calculateRating(69);
        expect(result, 'Gold');
      });

      test('70 returns Silver', () {
        final result = QuestionsCalculations.calculateRating(70);
        expect(result, 'Silver');
      });

      test('84 returns Silver', () {
        final result = QuestionsCalculations.calculateRating(84);
        expect(result, 'Silver');
      });

      test('85 returns Bronze', () {
        final result = QuestionsCalculations.calculateRating(85);
        expect(result, 'Bronze');
      });
    },
  );

  group(
    'CO2 emissions score -',
    () {
      test('Expected value returned', () {
        Results testResult = Results(
          1, 
          "99", 
          1, 
          "Bronze", 
          4, 
          "Medium", 
          "Eat meat a few times a week", 
          "Balance of prepackaged and fresh food items",
          "4-9 times per week",
          "More than 9 times per week",
          "3-5 new items",
          2,
          "Plastic Paper",
          15000,
          1000,
          "Only within the UK",
          8,
          7,
          8,
          6,
          2,
          3,
          6,
          30,
          16,
          10,
          2,
          1,
          0.0
          );

        final result = QuestionsCalculations.calculateCarbonEmissionsValue(testResult);
        expect(result, 1287.53);
      });
    },
  );
}
