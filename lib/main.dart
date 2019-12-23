import 'package:beenthere/screens/wrapper.dart';
import 'package:beenthere/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:beenthere/models/user.dart';

void main() {
  runApp(MyApp());
}

 class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return StreamProvider<User>.value(
          value: AuthService().user,
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
          home: Wrapper()
        ),
      );
    }
 }
