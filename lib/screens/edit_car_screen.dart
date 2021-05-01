import 'package:flutter/material.dart';
import 'package:midterm_project/model/car_model.dart';
import 'package:midterm_project/repository/car_helper.dart';


// ამ სქრინში შეგვიძლია მანქანის რომელიმე კომპონენტი შევასწოროთ
class EditCarScreen extends StatelessWidget {
  static const routeName = "/edit-car";
  final _formKey = GlobalKey<FormState>();

  //თქვენთან აქ შეიძლება late ების მიწერა დაჭირდეს null safety ს გამო.
  TextEditingController carImageUrl;
  TextEditingController carId;
  TextEditingController carBrand;
  TextEditingController carModel;
  TextEditingController carYear;
  TextEditingController carDescription;

  @override
  Widget build(BuildContext context) {
    // Map ით წამოღებული არგუმენტებით უკვე არსებულ TextEditingController ებში
    // ვსვამთ დაჭერილი მანქანის ინფოარმაციას
    final Map carData = ModalRoute.of(context).settings.arguments as Map;
    Car car = carData["car"];
    final int index = carData["index"];
    carImageUrl = TextEditingController(text: car.imageUrl);
    carId = TextEditingController(text: car.id.toString());
    carBrand = TextEditingController(text: car.brand);
    carModel = TextEditingController(text: car.model);
    carYear = TextEditingController(text: car.year.toString());
    carDescription = TextEditingController(text: car.description);
    return Scaffold(
      appBar: AppBar(
        title: Text("Adding New Car"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: carImageUrl,
                        decoration:
                        InputDecoration(hintText: "Please enter Image Url"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter valid Url";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: carId,
                        decoration:
                        InputDecoration(hintText: "Please Enter ID"),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter valid ID";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: carBrand,
                        decoration:
                        InputDecoration(hintText: "Please enter Brand"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter valid Brand";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: carModel,
                        decoration:
                        InputDecoration(hintText: "Please enter Model"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter valid Model";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: carYear,
                        decoration:
                        InputDecoration(hintText: "Please enter Year"),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter valid Year";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: carDescription,
                        decoration: InputDecoration(
                            hintText: "Please enter Description"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter valid Description";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("back"),
                      ),
                      ElevatedButton(
                        onPressed: () => {
                          //შეიძლება თქვენთან აქაც null safety ს გამო ერორი იყოს და currentState სთან ენდომება !
                          //ჩემთან ჩვეულებრივად მუშაობს
                          if (_formKey.currentState.validate()){
                              car = Car(
                              imageUrl: carImageUrl.text,
                              id: int.parse(carId.text),
                              brand: carBrand.text,
                              model: carModel.text,
                              year: int.parse(carYear.text),
                              description: carDescription.text,
                            ),
                            CarRepository().editCar(car, index),
                            Navigator.pop(context)
                          },
                        },
                        child: Text("Save"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
