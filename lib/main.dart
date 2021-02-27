import 'package:firebase_app/Screens/wrapper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Fire());
}
class Fire extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wrapper(),
    );
  }
}

