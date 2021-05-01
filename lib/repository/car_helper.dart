import 'package:midterm_project/model/car_model.dart';
import 'package:midterm_project/model/dummy_data.dart';


//helper მეთოდები DummyData დან ელემენტის დამატება, წაშლა, შესწორებისთვის.
class CarRepository {
  void addCar(Car car) {
    DUMMY_DATA.add(car);
  }


  void removeCar(int id) {
    DUMMY_DATA.removeWhere((element) => element.id == id);
  }

  void editCar(Car car, int index) {
    DUMMY_DATA.replaceRange(index, index + 1, [car]);
  }
}