import 'package:personal_carbon_footprint_app/data/user.dart';
import 'package:personal_carbon_footprint_app/shared/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'results.dart';
import 'dart:convert';

class SPHelper {
  static late SharedPreferences prefs;

  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  //Methods relating to user authentication
  Future writeUser(User user) async {
    //Add an 'U' to the stored value in sharedprefs to indicate it is a user entry
    prefs.setString('U' + user.id.toString(), jsonEncode(user.toJson()));
  }

  List<User> getUsers() {
    List<User> users = [];
    Set<String> keys = prefs.getKeys();
    keys.forEach((String key) {
      //Check to ensure the key is a 'user' ID type
      if (key != 'resultCounter' &&
          key != 'userCounter' &&
          !key.contains('R')) {
        User record = User.fromMap(json.decode(prefs.getString(key) ?? ''));
        users.add(record);
      }
    });
    return users;
  }

  int? getUserId(String username) {
    List<User> users = [];
    Set<String> keys = prefs.getKeys();
    keys.forEach((String key) {
      //Check to ensure the key is a 'user' ID type
      if (key != 'resultCounter' &&
          key != 'userCounter' &&
          !key.contains('R')) {
        User record = User.fromMap(json.decode(prefs.getString(key) ?? ''));
        users.add(record);
      }
    });

    int userId = 0;
    for (var user in users) {
      if (user.username == username) {
        userId = user.id;
      }
    }

    return userId;
  }

  Future setUserCounter() async {
    int counter = prefs.getInt('userCounter') ?? 0;
    counter++;
    await prefs.setInt('userCounter', counter);
  }

  int getUserCounter() {
    return prefs.getInt('userCounter') ?? 0;
  }

  Future deleteUser(int id) async {
    prefs.remove('U' + id.toString());
  }

  //Methods relating to carbon footprint results
  Future writeResults(Results results) async {
    //Add an 'R' to the stored value in sharedprefs to indicate it is a results entry
    prefs.setString('R' + results.id.toString(), jsonEncode(results.toJson()));
  }

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

  Future setCounter() async {
    int counter = prefs.getInt('resultCounter') ?? 0;
    counter++;
    await prefs.setInt('resultCounter', counter);
  }

  int getCounter() {
    return prefs.getInt('resultCounter') ?? 0;
  }

  Future deleteResult(int id) async {
    prefs.remove('R$id');
  }
}
