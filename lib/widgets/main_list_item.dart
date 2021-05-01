import 'package:flutter/material.dart';

class MainListItem extends StatefulWidget {
  final String imageUrl;
  final String brand;
  final String model;
  final int year;

  MainListItem(
    this.imageUrl,
    this.brand,
    this.model,
    this.year,
  );

  @override
  _MainListItemState createState() => _MainListItemState();
}

class _MainListItemState extends State<MainListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              child: FadeInImage(
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: AssetImage("assets/image/car_placeholder.png"),
                image: NetworkImage(widget.imageUrl),
              ),
            ),
            Text("${widget.brand} ${widget.model}"),
            Text(widget.year.toString())
          ],
        ),
      ),
    );
  }
}
