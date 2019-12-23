import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

Widget screenAdd() {
  return DecoratedBox(
      position: DecorationPosition.background,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage('assets/waze-background.png'), fit: BoxFit.cover),
      ),
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(children: <Widget>[
            Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text("Add Location",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      color: Colors.black,
                    )),
              )),
              Flexible(
                child: Text(
                    "Add the current or specified GPS location to a new or existing local category.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0,
                      color: Colors.black,
                    )),
              ),
              Flexible(
                  child: Column(
                children: <Widget>[
                  FormBuilder(
                    key: _fbKey,
                    initialValue: {
                      'date': DateTime.now(),
                      'accept_terms': false,
                    },
                    autovalidate: true,
                    child: Column(
                      children: <Widget>[
                        FormBuilderDateTimePicker(
                          attribute: "date",
                          inputType: InputType.date,
                          format: DateFormat("yyyy-MM-dd"),
                          decoration:
                              InputDecoration(labelText: "Appointment Time"),
                        ),
                        FormBuilderSlider(
                          attribute: "slider",
                          validators: [FormBuilderValidators.min(6)],
                          min: 0.0,
                          max: 10.0,
                          initialValue: 1.0,
                          divisions: 20,
                          decoration:
                              InputDecoration(labelText: "Number of things"),
                        ),
                        FormBuilderCheckbox(
                          attribute: 'accept_terms',
                          label: Text(
                              "I have read and agree to the terms and conditions"),
                          validators: [
                            FormBuilderValidators.requiredTrue(
                              errorText:
                                  "You must accept terms and conditions to continue",
                            ),
                          ],
                        ),
                        FormBuilderDropdown(
                          attribute: "gender",
                          decoration: InputDecoration(labelText: "Gender"),
                          // initialValue: 'Male',
                          hint: Text('Select Gender'),
                          validators: [FormBuilderValidators.required()],
                          items: ['Male', 'Female', 'Other']
                              .map((gender) => DropdownMenuItem(
                                  value: gender, child: Text("$gender")))
                              .toList(),
                        ),
                        FormBuilderTextField(
                          attribute: "age",
                          decoration: InputDecoration(labelText: "Age"),
                          validators: [
                            FormBuilderValidators.numeric(),
                            FormBuilderValidators.max(70),
                          ],
                        ),
                        FormBuilderSegmentedControl(
                          decoration: InputDecoration(
                              labelText: "Movie Rating (Archer)"),
                          attribute: "movie_rating",
                          options: List.generate(5, (i) => i + 1)
                              .map((number) =>
                                  FormBuilderFieldOption(value: number))
                              .toList(),
                        ),
                        FormBuilderSwitch(
                          label: Text('I Accept the tems and conditions'),
                          attribute: "accept_terms_switch",
                          initialValue: true,
                        ),
                        FormBuilderStepper(
                          decoration: InputDecoration(labelText: "Stepper"),
                          attribute: "stepper",
                          initialValue: 10,
                          step: 1,
                        ),
                        FormBuilderRate(
                          decoration:
                              InputDecoration(labelText: "Rate this form"),
                          attribute: "rate",
                          iconSize: 32.0,
                          initialValue: 1,
                          max: 5,
                        ),
                        FormBuilderCheckboxList(
                          decoration: InputDecoration(
                              labelText: "The language of my people"),
                          attribute: "languages",
                          initialValue: ["Dart"],
                          options: [
                            FormBuilderFieldOption(value: "Dart"),
                            FormBuilderFieldOption(value: "Kotlin"),
                            FormBuilderFieldOption(value: "Java"),
                            FormBuilderFieldOption(value: "Swift"),
                            FormBuilderFieldOption(value: "Objective-C"),
                          ],
                        ),
                        FormBuilderSignaturePad(
                          decoration: InputDecoration(labelText: "Signature"),
                          attribute: "signature",
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      MaterialButton(
                        child: Text("Submit"),
                        onPressed: () {
                          if (_fbKey.currentState.saveAndValidate()) {
                            print(_fbKey.currentState.value);
                          }
                        },
                      ),
                      MaterialButton(
                        child: Text("Reset"),
                        onPressed: () {
                          _fbKey.currentState.reset();
                        },
                      ),
                    ],
                  )
                ],
              ))
            ])
          ])));
}
