import 'package:flutter/material.dart';

//File to contain all global variables which can be used across the app
//and manage part of the apps state

//Variable to hold the list of suggestions based on answers to the carbon footprint questions
List<String> improvementSuggestions = [];
//Variable to show if the user is logged in
bool isLoggedIn = false;
//Variable to store logged in user id
int loggedInUserId = 0;
//Variable for encryption key for passwords
const encrpytionKey = "dNAM5)0r@&.)ENG1";
//Method which add the shadow to text in the app
Shadow globalShadowText() {
  return const Shadow(
      offset: Offset(1.0, 1.0), blurRadius: 1.0, color: Colors.grey);
}
