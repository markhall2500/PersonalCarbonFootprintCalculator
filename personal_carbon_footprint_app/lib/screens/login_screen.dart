import 'package:flutter/material.dart';
import 'package:personal_carbon_footprint_app/data/sp_helper.dart';
import 'package:personal_carbon_footprint_app/data/user.dart';
import 'package:personal_carbon_footprint_app/helpers/login_validators.dart';
import 'package:personal_carbon_footprint_app/helpers/register_validators.dart';
import 'package:personal_carbon_footprint_app/screens/intro_screen.dart';
import 'package:personal_carbon_footprint_app/screens/register_screen.dart';
import 'package:personal_carbon_footprint_app/shared/globals.dart';

//This class builds the login screen in the app
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Variables used to update the form, users list and manage the text fields
  List<User> users = [];
  final _formKey = GlobalKey<FormState>();
  final SPHelper helper = SPHelper();
  final TextEditingController txtUsernameField = TextEditingController();
  final TextEditingController txtPasswordField = TextEditingController();

  @override
  void initState() {
    helper.init().then((value) {
      updateScreen();
    });
    super.initState();
  }

  //variables for the fontsize and results variables
  final double fontSize = 16;

  //Variables for help text on questions
  String usernameMessage = 'Username';
  String passwordMessage = 'Password';
  String errorMessage = '';
  bool isCredentialsValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Precious World'),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/blueAndWhiteCloudySky.jpg'),
                fit: BoxFit.cover)),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(children: [
              //Title for the page
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    'Welcome to \nOur Precious World',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        shadows: [globalShadowText()]),
                  ),
                ),
              ),
              //Username field
              Padding(
                padding:
                    const EdgeInsets.only(top: 32.0, left: 32.0, right: 32.0),
                child: TextFormField(
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize,
                        shadows: [globalShadowText()]),
                    controller: txtUsernameField,
                    decoration: InputDecoration(hintText: usernameMessage),
                    validator: (value) {
                      return LoginValidators.usernameValidator(value);
                    },
                    keyboardType: TextInputType.number),
              ),
              //Password field
              Padding(
                padding:
                    const EdgeInsets.only(top: 32.0, left: 32.0, right: 32.0),
                child: TextFormField(
                    obscureText: true,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize,
                        shadows: [globalShadowText()]),
                    controller: txtPasswordField,
                    decoration: InputDecoration(hintText: passwordMessage),
                    validator: (value) {
                      return LoginValidators.passwordValidator(value);
                    },
                    keyboardType: TextInputType.number),
              ),
              //Error message for failed login
              Padding(
                  padding: const EdgeInsets.only(
                      top: 35.0, left: 32.0, right: 32.0, bottom: 35.0),
                  child: Text(
                    errorMessage,
                    style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        shadows: [globalShadowText()]),
                  )),
              //Login button
              Padding(
                padding: const EdgeInsets.only(
                  left: 32.0, right: 32.0, bottom: 20.0),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isCredentialsValid = !isCredentialsValid;
                      });
                      if (_formKey.currentState!.validate()) {
                        String usernameInput = txtUsernameField.text;
                        String passwordInput = txtPasswordField.text;

                        //Check if a username and password match a registered users
                        for (var user in users) {
                          if (user.username == usernameInput) {
                            var decryptedPassword =
                                RegisterValidators.passwordDecryption(
                                    user.password);
                            if (decryptedPassword == passwordInput) {
                              isLoggedIn = true;
                              loggedInUserId = helper.getUserId(user.username);
                            }
                          }
                        }

                        //If user is logged in, redirect them to the intro screen
                        if (isLoggedIn) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const IntroScreen()),
                          );
                        } else {
                          //setState(() {
                          //myBool = !myBool;
                          // });
                          errorMessage = "Username or password is incorrect";
                          Visibility(
                              visible: isCredentialsValid,
                              child: Text(errorMessage));
                        }
                      }
                    },
                    child: Text('Login',
                        style: TextStyle(
                            fontSize: fontSize,
                            shadows: [globalShadowText()]))),
              ),
              //Register button
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()),
                      );
                    },
                    child: Text('Register',
                        style: TextStyle(
                            fontSize: fontSize,
                            shadows: [globalShadowText()]))),
              ),
              //Countinue without registration button
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 80.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const IntroScreen()),
                      );
                    },
                    child: Text('Continue without registration',
                        style: TextStyle(
                            fontSize: fontSize,
                            shadows: [globalShadowText()]))),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void updateScreen() {
    users = helper.getUsers();
    setState(() {});
  }
}
