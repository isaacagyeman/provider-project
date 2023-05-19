import 'package:flutter/material.dart';

class JokeCard extends StatelessWidget {
  const JokeCard({Key? key, required this.jokemap}) : super(key: key);
  final Map<String, dynamic> jokemap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            '${jokemap['joke']}',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18
            ),
            ),
          ),
      ),
      );
  }
}
