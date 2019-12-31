import 'package:beenthere/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

final GlobalKey<FormBuilderState> _fbSignInKey = GlobalKey<FormBuilderState>();

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Color(0xFF3F5AA6),
            elevation: 0.0,
            title: Text('Sign in to Been There'),
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person_add),
                label: Text('Register'),
                textColor: Colors.white,
                onPressed: () {
                  widget.toggleView();
                },
              )
            ]),
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
                          onChanged: (val) {
                            setState(() =>  error = ''); 
                          }
                        ),
                        FormBuilderTextField(
                          attribute: "password",
                          decoration: InputDecoration(labelText: "Password"),
                          obscureText: true,
                          maxLines: 1,
                          validators: [FormBuilderValidators.minLength(6, errorText: 'Passwords must be at least 6 characters')],
                          onChanged: (val) {
                            setState(() =>  error = ''); 
                          }
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
                      dynamic result = await _auth.signInWithEmailAndPassword(_fbSignInKey.currentState.value['emailaddress'], _fbSignInKey.currentState.value['password']);
                      if (result == null) {
                        setState(() => error = 'Error signing in. Check email and password.');
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
            ),
            Row(children: <Widget>[
              SizedBox(height: 12.0)
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0)
              )
            ],)
          ],
        ));
  }
}
