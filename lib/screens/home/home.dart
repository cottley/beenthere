import 'package:beenthere/screens/home/about.dart';
import 'package:beenthere/screens/home/add.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
          length:4,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Color(0xFF3F5AA6),
              title: Text("Been There"),
            ),
            bottomNavigationBar: menu(),
            body: TabBarView(
              children: [
                Container(child: Icon(Icons.directions_transit)),
                Container(child: screenAdd()),
                Container(child: Icon(Icons.directions_car)),
                Container(child: screenAbout()),
              ],
            ),
          ),
        ),
    );
  }
}

Widget menu() {
return Container(
  color: Color(0xFF3F5AA6),
  child: TabBar(
    labelColor: Colors.white,
    unselectedLabelColor: Colors.white70,
    indicatorSize: TabBarIndicatorSize.tab,
    indicatorPadding: EdgeInsets.all(5.0),
    indicatorColor: Colors.blue,
    tabs: [
      Tab(
        text: "Home",
        icon: Icon(Icons.home),
      ),
      Tab(
        text: "Add",
        icon: Icon(Icons.add_location),
      ),
      Tab(
        text: "Categories",
        icon: Icon(Icons.category),
      ),
      Tab(
        text: "About",
        icon: Icon(Icons.help),
      ),      
    ],
  ),
);
}