import 'dart:math';
import 'dart:typed_data';
import 'package:personal_carbon_footprint_app/data/sp_helper.dart';
import 'package:personal_carbon_footprint_app/data/user.dart';
import 'package:personal_carbon_footprint_app/helpers/cryptography.dart';
import 'package:personal_carbon_footprint_app/shared/globals.dart';

class RegisterValidators {
  //Private constructor to prevent instantiation
  RegisterValidators._();
  final SPHelper helper = SPHelper();
  final Cryptography crypto = Cryptography();
  static const keyString = "aufshfiefdjsofls";

  static String? usernameValidator(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.length < 6 ||
        value == 'Please enter a username with at least 6 characters') {
      return 'Please enter a username with at least 6 characters';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.length < 6 ||
        value == 'Please enter a password with at least 6 characters') {
      return 'Please enter a password with at least 6 characters';
    }
    return null;
  }

  static String passwordEncryption(String password) {
    var encrpytedPassword =
        Cryptography.encryptPasswordViaAES(password, encrpytionKey);
    return encrpytedPassword;
  }

  static String passwordDecryption(String encrpytedPassword) {
    var decryptedPassword =
        Cryptography.decryptPasswordViaAES(encrpytedPassword, encrpytionKey);
    return decryptedPassword;
  }

  static bool checkForUsernameDuplicate(String username, List<User> usersList) {
    bool duplicateUser = false;
    for (var nameInList in usersList) {
      if (username == nameInList.username) {
        duplicateUser = true;
      }
    }
    return duplicateUser;
  }

  Uint8List generateRandomKey() {
    final random = Random.secure();
    final key = List<int>.generate(32, (_) => random.nextInt(256));
    return Uint8List.fromList(key);
  }
}
