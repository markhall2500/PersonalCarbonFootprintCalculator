import 'package:personal_carbon_footprint_app/data/user.dart';
import 'package:personal_carbon_footprint_app/shared/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'results.dart';
import 'dart:convert';

//This class manages the CRUD operations relating to shared objects
//throughout the system

class SPHelper {
  //Variable to store the apps data  
  static late SharedPreferences prefs;

  //Create a singleton instance of SharedPreferences
  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  //Method relating to user authentication - adding a new user
  Future writeUser(User user) async {
    //Add a 'U' to the stored value in sharedprefs to indicate it is a user entry
    prefs.setString('U${user.id}', jsonEncode(user.toJson()));
  }

  //Method to get all of the current users in the system
  List<User> getUsers() {
    List<User> users = [];
    Set<String> keys = prefs.getKeys();
    for (var key in keys) {
      //Check to ensure the key is a 'user' ID type
      if (key != 'resultCounter' &&
          key != 'userCounter' &&
          !key.contains('R')) {
        User record = User.fromMap(json.decode(prefs.getString(key) ?? ''));
        users.add(record);
      }
    }
    return users;
  }

  //Method to get a single user in the system using the unique username
  int getUserId(String username) {
    List<User> users = [];
    Set<String> keys = prefs.getKeys();
    for (var key in keys) {
      //Check to ensure the key is a 'user' ID type
      if (key != 'resultCounter' &&
          key != 'userCounter' &&
          !key.contains('R')) {
        User record = User.fromMap(json.decode(prefs.getString(key) ?? ''));
        users.add(record);
      }
    }

    int userId = 0;
    for (var user in users) {
      if (user.username == username) {
        userId = user.id;
      }
    }

    return userId;
  }

  //Method to set the counter for a new user
  Future setUserCounter() async {
    int counter = prefs.getInt('userCounter') ?? 0;
    counter++;
    await prefs.setInt('userCounter', counter);
  }

  //Method to get the current latest count for a user
  int getUserCounter() {
    return prefs.getInt('userCounter') ?? 0;
  }

  //Method to delete a user based on their unique user ID
  Future deleteUser(int id) async {
    prefs.remove('U$id');
  }

  //Method to write a new result
  Future writeResults(Results results) async {
    //Add an 'R' to the stored value in sharedprefs to indicate it is a results entry
    prefs.setString('R${results.id}', jsonEncode(results.toJson()));
  }

  //Method which will return all of their results based on their unique user ID
  List<Results> getResultsForLoggedInUser() {
    if (isLoggedIn) {
      List<Results> results = [];
      Set<String> keys = prefs.getKeys();
      for (var key in keys) {
        //Check to ensure the key is a 'results' ID type
        if (key != 'resultCounter' &&
            key != 'userCounter' &&
            !key.contains('U')) {
          Results result =
              Results.fromAnswers(json.decode(prefs.getString(key) ?? ''));
          if (result.userId == loggedInUserId) {
            results.add(result);
          }
        }
      }
      return results;
    } else {
      return [];
    }
  }

  //Method to set the counter for a new result
  Future setCounter() async {
    int counter = prefs.getInt('resultCounter') ?? 0;
    counter++;
    await prefs.setInt('resultCounter', counter);
  }

  //Method to get the current latest count for a user
  int getCounter() {
    return prefs.getInt('resultCounter') ?? 0;
  }

  //Method to delete a result based on their unique result ID
  Future deleteResult(int id) async {
    prefs.remove('R$id');
  }
}
