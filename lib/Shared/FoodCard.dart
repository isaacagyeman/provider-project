import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({Key? key, required this.map}) : super(key: key);
  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network('${map['image']}'),
              SizedBox(height: 10.0),
              Text(
                '${map['title']}',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
