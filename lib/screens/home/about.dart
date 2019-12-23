import 'package:flutter/material.dart';

Widget screenAbout() {
  return DecoratedBox(
      position: DecorationPosition.background,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage('assets/waze-background.png'), fit: BoxFit.cover),
      ),
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: Text("About\n",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  color: Colors.black,
                )),
          ),
          Flexible(
            child: Text(
                "Create and Manage lists of locations\nof places you have already been.\nSend them to Waze(tm) to get directions.\n\nDesigned and Developed by Christopher Ottley.\n\nWaze Icon Copyright Waze.\n\nCopyright (c) 2015-2019 Christopher Ottley.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14.0,
                  color: Colors.black,
                )),
          )
        ],
      )));
}
