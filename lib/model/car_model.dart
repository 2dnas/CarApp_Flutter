
//მთავარი car კლასის მოდელი
class Car {
  final int id;
  final String brand;
  final String model;
  final String imageUrl;
  final int year;
  final String description;


  //required ები ჩემთან ერორს არტყავს ალბათ null safety ს გამო და მოვაშორე
  //თქვენთან თუ ერორი ამოაგდო რამეზე უბრალოდ მიუწერეთ required და გასწორდება წესით ყველაფერი
  Car({
     this.imageUrl,
     this.id,
     this.brand,
     this.model,
     this.year,
     this.description,
  });
}