import 'package:beenthere/screens/authenticate/authenticate.dart';
import 'package:beenthere/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:beenthere/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    // Return either home or authenticate
    return Authenticate();
  }
}