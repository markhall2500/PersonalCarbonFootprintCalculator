import 'package:flutter_test/flutter_test.dart';
import 'package:personal_carbon_footprint_app/helpers/register_validators.dart';

void main(){
  group(
    'Register page fields -',
    () {
     test('Empty username', () {
        final result =
            RegisterValidators.usernameValidator('');
        expect(result, 'Please enter a username with at least 6 characters');
         });
  
     test('Username under 6 characters', () {
        final result =
            RegisterValidators.usernameValidator('abcde');
        expect(result, 'Please enter a username with at least 6 characters');
         });

    test('Empty password', () {
        final result =
            RegisterValidators.passwordValidator('');
        expect(result, 'Please enter a password with at least 6 characters');
         });

     test('password under 6 characters', () {
        final result =
            RegisterValidators.passwordValidator('abcde');
        expect(result, 'Please enter a password with at least 6 characters');
         });
    },
  );
}