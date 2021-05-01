import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:midterm_project/model/car_model.dart';
import 'package:midterm_project/repository/car_helper.dart';

//სქრინი რომელზეც მოხდება ახალი მანქანის დამატება ლისტში.
class CarAddScreen extends StatelessWidget {
  static const routeName = "/add-screen";

  final _formKey = GlobalKey<FormState>();

  TextEditingController carImageUrl = TextEditingController();
  TextEditingController carId = TextEditingController();
  TextEditingController carBrand = TextEditingController();
  TextEditingController carModel = TextEditingController();
  TextEditingController carYear = TextEditingController();
  TextEditingController carDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Car car = Car();
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
                            CarRepository().addCar(car),
                            Navigator.pop(context)
                            },
                        },
                        child: Text("Add"),
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
