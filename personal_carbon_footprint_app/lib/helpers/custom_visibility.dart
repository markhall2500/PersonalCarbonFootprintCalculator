import 'package:flutter/material.dart';

//This class contians the model and visibility of results page widgets on the 
//basis that the user is logged in and has existing results
class CustomVisibility extends StatelessWidget {
  final List<bool> conditions;
  final Widget child;

  const CustomVisibility(
      {required this.conditions, required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
    // returns true if all `conditions` are true, returns false otherwise
      visible: conditions.every((element) => element),
      child: child,
    );
  }
}
