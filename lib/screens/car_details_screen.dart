import 'package:flutter/material.dart';
import 'package:midterm_project/model/car_model.dart';
import 'package:midterm_project/repository/car_helper.dart';
import 'package:midterm_project/screens/home_screen.dart';

//სქრინი სადაც გვიჩვენებს ამა თუ იმ მანქანის დეტალებს
class CarDetailsScreen extends StatelessWidget {
  static const routeName = "/details-screen";

  @override
  Widget build(BuildContext context) {
    //აქ ეს as Car ჩემთან არ ჭირდება მაგრამ არაფერს მიშლის და null safety ზე ერორს დაატყავდა ამიტომ მივაწერ ჩემი რამიდის
    final Car car = ModalRoute
        .of(context)
        .settings
        .arguments as Car;
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () =>
                showDialog(
                  context: context,
                  builder: (_) =>
                      AlertDialog(
                        title: Text("Are you Sure?"),
                        content: Text("You are Deleting ${car.brand} ${car
                            .model} from List"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("No"),
                          ),
                          TextButton(
                            onPressed: () {
                              CarRepository().removeCar(car.id);
                              Navigator.pop(context);
                              Navigator.pushNamed(context, HomeScreen.routeName);
                            },
                            child: Text("Yes"),
                          )
                        ],
                      ),
                ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.network(car.imageUrl),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Brand:"),
                    Text(car.brand),
                  ],
                ),
              ),
              Card(
                elevation: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Model:"),
                    Text(car.model),
                  ],
                ),
              ),
              Card(
                elevation: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Year:"),
                    Text(car.year.toString()),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                child: Text(car.description),
              )
            ],
          ),
        ),
      ),
    );
  }
}
