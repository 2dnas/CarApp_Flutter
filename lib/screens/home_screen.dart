import 'package:flutter/material.dart';
import 'package:midterm_project/model/car_model.dart';
import 'package:midterm_project/model/dummy_data.dart';
import 'package:midterm_project/screens/car_add_screen.dart';
import 'package:midterm_project/screens/car_details_screen.dart';
import 'package:midterm_project/screens/edit_car_screen.dart';
import 'package:midterm_project/widgets/main_list_item.dart';

List<Car> carList = DUMMY_DATA;

class HomeScreen extends StatefulWidget {
  static const routeName = "/main-screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Car App"),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => {
                    Navigator.pushNamed(context, CarAddScreen.routeName)
                        .then((_) {
                      setState(() {});
                    })
                  }),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          var car = carList[index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
                    context, CarDetailsScreen.routeName,
                    arguments: car)
                .then((_) {
              setState(() {});
            }),
            onLongPress: () {
              Navigator.pushNamed(context, EditCarScreen.routeName,
                  arguments: {"car": car, "index": index}).then((_) {
                setState(() {});
              });
            },
            child: MainListItem(
              car.imageUrl,
              car.brand,
              car.model,
              car.year,
            ),
          );
        },
        itemCount: carList.length,
      ),
    );
  }
}
