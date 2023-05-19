import 'package:flutter/material.dart';
import 'package:providerproject/Views/iptrackPage.dart';
import 'package:providerproject/Views/jokesPage.dart';
import 'package:providerproject/Views/todoPage.dart';

import '../Views/foodPage.dart';

class Mainpage extends StatefulWidget {
  Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int itemClicked = 0;
  var pages = [
    TodoPage(),
    FoodPage(),
    JokePage(),
    IpTrackPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Awesome App"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.purple,
        leading: null,
      ),
      body: pages[itemClicked],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.purple,
          type: BottomNavigationBarType.fixed,
          elevation: 40,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: itemClicked,
          onTap: (value) {
            setState(() {
              itemClicked = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.book), label: "Todo"),
            BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: "Food"),
            BottomNavigationBarItem(icon: Icon(Icons.emoji_emotions), label: "Jokes"),
            BottomNavigationBarItem(icon: Icon(Icons.map), label: "Track ip")
          ]),
    );
  }
}
