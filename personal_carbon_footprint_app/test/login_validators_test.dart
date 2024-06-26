import 'package:flutter_test/flutter_test.dart';
import 'package:personal_carbon_footprint_app/helpers/login_validators.dart';

//This file contains tests which are checking the validation on the login page
void main(){
  group(
    'Login page fields -',
    () {
     test('Empty username provided', () {
        final result =
            LoginValidators.usernameValidator('');
        expect(result, 'Please enter your username');
         });

    test('Empty password provided', () {
        final result =
            LoginValidators.passwordValidator('');
        expect(result, 'Please enter your password');
         });
    },
  );
}