import 'package:personal_carbon_footprint_app/data/sp_helper.dart';
import 'package:personal_carbon_footprint_app/data/user.dart';
import 'package:personal_carbon_footprint_app/helpers/cryptography.dart';
import 'package:personal_carbon_footprint_app/shared/globals.dart';

//This class provides the validation and processing for the registration page
class RegisterValidators {
  //Private constructor to prevent instantiation
  RegisterValidators._();

  //Variables required for the registration 
  final SPHelper helper = SPHelper();
  final Cryptography crypto = Cryptography();
  static const keyString = "aufshfiefdjsofls";

  //Validation method for the username form field
  static String? usernameValidator(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.length < 6 ||
        value == 'Please enter a username with at least 6 characters') {
      return 'Please enter a username with at least 6 characters';
    }
    return null;
  }

  //Validation method for the password form field
  static String? passwordValidator(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.length < 6 ||
        value == 'Please enter a password with at least 6 characters') {
      return 'Please enter a password with at least 6 characters';
    }
    return null;
  }

  //Method to perform the encryption of the plaintext password
  static String passwordEncryption(String password) {
    var encrpytedPassword =
        Cryptography.encryptPasswordViaAES(password, encrpytionKey);
    return encrpytedPassword;
  }

  //Method to perform the decryption of the encrypted password
  static String passwordDecryption(String encrpytedPassword) {
    var decryptedPassword =
        Cryptography.decryptPasswordViaAES(encrpytedPassword, encrpytionKey);
    return decryptedPassword;
  }

  //Validation method to ensure the username is unique
  static bool checkForUsernameDuplicate(String username, List<User> usersList) {
    bool duplicateUser = false;
    for (var nameInList in usersList) {
      if (username == nameInList.username) {
        duplicateUser = true;
      }
    }
    return duplicateUser;
  }
}
