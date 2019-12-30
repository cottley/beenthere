import 'package:beenthere/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

final GlobalKey<FormBuilderState> _fbSignInKey = GlobalKey<FormBuilderState>();

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Color(0xFF3F5AA6),
            elevation: 0.0,
            title: Text('Sign in to Been There')),
        body: Column(
          children: <Widget>[
            FormBuilder(
                key: _fbSignInKey,
                initialValue: {},
                autovalidate: true,
                child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        FormBuilderTextField(
                          attribute: "emailaddress",
                          decoration:
                              InputDecoration(labelText: "eMail Address"),
                          maxLines: 1,
                          validators: [FormBuilderValidators.email()],
                        ),
                        FormBuilderTextField(
                          attribute: "password",
                          decoration: InputDecoration(labelText: "Password"),
                          obscureText: true,
                          maxLines: 1,
                        )
                      ],
                    ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  child: Text("Sign In"),
                  onPressed: () async {
                    if (_fbSignInKey.currentState.saveAndValidate()) {
                      print(_fbSignInKey.currentState.value);
                      print(_fbSignInKey.currentState.value['emailaddress']);
                      dynamic result = await _auth.signInAnon();
                      if (result == null) {
                        print('Error signing in');
                      } else {
                        print('Signed in');
                        print(result.uid);
                      }
                    }
                  },
                ),
                MaterialButton(
                  child: Text("Reset"),
                  onPressed: () {
                    _fbSignInKey.currentState.reset();
                  },
                ),
              ],
            )
          ],
        ));
  }
}
