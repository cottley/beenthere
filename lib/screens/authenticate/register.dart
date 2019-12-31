import 'package:beenthere/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

final GlobalKey<FormBuilderState> _fbRegisterKey = GlobalKey<FormBuilderState>();

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Color(0xFF3F5AA6),
            elevation: 0.0,
            title: Text('Register for Been There'),
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.input),
                label: Text('Sign In'),
                textColor: Colors.white,
                onPressed: () {
                  widget.toggleView();
                },
              )
            ]),
        body: Column(
          children: <Widget>[
            FormBuilder(
                key: _fbRegisterKey,
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
                  child: Text("Register"),
                  onPressed: () async {
                    if (_fbRegisterKey.currentState.saveAndValidate()) {
                      dynamic result = await _auth.registerWithEmailAndPassword(_fbRegisterKey.currentState.value['emailaddress'], _fbRegisterKey.currentState.value['password']);
                      if (result == null) {
                        setState(() => error = 'Error registering');
                      } else {  
                        print('Registered');
                      }
                    }
                  },
                ),
                MaterialButton(
                  child: Text("Reset"),
                  onPressed: () {
                    _fbRegisterKey.currentState.reset();
                  },
                ),
              ],
            )
            ,
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
        )
        );
  }
}