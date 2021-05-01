import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:midterm_project/screens/car_add_screen.dart';
import 'package:midterm_project/screens/car_details_screen.dart';
import 'package:midterm_project/screens/edit_car_screen.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car app',
      theme: ThemeData(
        accentColor: Colors.amber,
      ),
      home: HomeScreen(),
      routes: {
        CarAddScreen.routeName: (context) => CarAddScreen(),
        CarDetailsScreen.routeName: (context) => CarDetailsScreen(),
        HomeScreen.routeName : (context) => HomeScreen(),
        EditCarScreen.routeName: (context) => EditCarScreen(),
      },
    );
  }
}
