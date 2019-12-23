import 'package:beenthere/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Return either home or authenticate
    return Home();
  }
}