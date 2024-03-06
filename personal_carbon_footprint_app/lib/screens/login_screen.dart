import 'package:flutter/material.dart';
import 'package:personal_carbon_footprint_app/data/sp_helper.dart';
import 'package:personal_carbon_footprint_app/data/user.dart';
import 'package:personal_carbon_footprint_app/helpers/login_validators.dart';
import 'package:personal_carbon_footprint_app/helpers/register_validators.dart';
import 'package:personal_carbon_footprint_app/screens/intro_screen.dart';
import 'package:personal_carbon_footprint_app/screens/register_screen.dart';
import 'package:personal_carbon_footprint_app/shared/globals.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
  final double fontSize = 14;

  //Variables for help text on questions
  String usernameMessage = '';
  String passwordMessage = '';
  String errorMessage = '';
  bool isCredentialsValid = false;

  //!!!!!!!!!!Add button to continue without user
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Precious World'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('blueAndWhiteCloudySky.jpg'),
                fit: BoxFit.cover)),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(children: [
              //Title for the page
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  'Please enter your login credentials',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              //Username field
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: TextFormField(
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: fontSize),
                    controller: txtUsernameField,
                    decoration: InputDecoration(hintText: usernameMessage),
                    validator: (value) {
                      return LoginValidators.usernameValidator(value);
                    },
                    keyboardType: TextInputType.number),
              ),
              //Password field
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: TextFormField(
                    obscureText: true,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: fontSize),
                    controller: txtPasswordField,
                    decoration: InputDecoration(hintText: passwordMessage),
                    validator: (value) {
                      return LoginValidators.passwordValidator(value);
                    },
                    keyboardType: TextInputType.number),
              ),
              //Error message for failed login
              Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    errorMessage,
                    style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  )),
              //Login button
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isCredentialsValid = !isCredentialsValid;
                      });
                      if (_formKey.currentState!.validate()) {
                        String usernameInput = txtUsernameField.text;
                        String passwordInput = txtPasswordField.text;

                        //Check if a username and password match a registered users
                        users.forEach((user) {
                          if (user.username == usernameInput) {
                            var decryptedPassword =
                                RegisterValidators.passwordDecryption(
                                    user.password);
                            if (decryptedPassword == passwordInput) {
                              isLoggedIn = true;
                              loggedInUserId = helper.getUserId(user.username);
                            }
                          }
                        });

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
                            child: Text(errorMessage)
                          ); //!!!ADD A MESSAGE STATING USERNAME OR PASSWORD IS INCORRECT
                        }
                      }
                    },
                    child: Text('Login', style: TextStyle(fontSize: fontSize))),
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
                    child:
                        Text('Register', style: TextStyle(fontSize: fontSize))),
              ),
              //Countinue without registration button
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const IntroScreen()),
                      );
                    },
                    child:
                        Text('Continue without registration', style: TextStyle(fontSize: fontSize))),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void getUsers() {}

  void updateScreen() {
    users = helper.getUsers();
    setState(() {});
  }
}
