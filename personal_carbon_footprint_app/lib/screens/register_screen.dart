import 'package:flutter/material.dart';
import 'package:personal_carbon_footprint_app/data/sp_helper.dart';
import 'package:personal_carbon_footprint_app/data/user.dart';
import 'package:personal_carbon_footprint_app/helpers/register_validators.dart';
import 'package:personal_carbon_footprint_app/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
  String successMessage = '';
  bool isRegistrationSuccessful = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Precious World'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lightBlueSky.jpg'), fit: BoxFit.cover)),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(children: [
              //Title for the page
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  'Please enter your new credentials',
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
                      return RegisterValidators.usernameValidator(value);
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
                      return RegisterValidators.passwordValidator(value);
                    },
                    keyboardType: TextInputType.number),
              ),
              //Confirmation message for successful registration login
              Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    successMessage,
                    style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 100, 5, 215)),
                  )),
              //Create user button
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isRegistrationSuccessful = !isRegistrationSuccessful;
                      });
                      if (_formKey.currentState!.validate()) {
                        String usernameInput = txtUsernameField.text;
                        String passwordInput = txtPasswordField.text;
                        //ADD CHECK IF USER NAME ALREADY EXISTS THEN DO NOT EXECUTE THE BELOW AND ADD A MESSAGE
                        var doesUsernameExist =
                            RegisterValidators.checkForUsernameDuplicate(
                              usernameInput, 
                              helper.getUsers());
                        if(doesUsernameExist){
                            successMessage =
                            "Username already exists, please choose a different username";
                        } else {
                            var passwordEncryption =
                            RegisterValidators.passwordEncryption(
                                passwordInput);
                            passwordEncryption = passwordEncryption;
                            int id = helper.getUserCounter() + 1;
                            User user = User(id, usernameInput, passwordEncryption);
                            helper.writeUser(user).then((_) {
                            helper.setUserCounter();
                            successMessage =
                            "User registered successfully, please proceed to the login page";
                        });     
                        }

                     Visibility(
                            visible: isRegistrationSuccessful,
                            child: Text(successMessage));
                      }
                    },
                    child: Text('Create user',
                        style: TextStyle(fontSize: fontSize))),
              ),
              //Return to login screen button
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: Text('Return to login screen',
                        style: TextStyle(fontSize: fontSize))),
              )
            ]),
          ),
        ),
      ),
    );
  }

  void updateScreen() {
    setState(() {});
  }
}
