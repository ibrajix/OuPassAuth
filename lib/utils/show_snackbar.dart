import 'package:flutter/material.dart';

class Utility {

  Utility._();

  static showSnackBar(BuildContext context, String message){
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}