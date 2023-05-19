// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerproject/Screens/Splash.dart';
import 'package:providerproject/services/food_Service.dart';
import 'package:providerproject/services/jokes_Service.dart';
import 'package:providerproject/services/todo_Service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodoService(),
          ),
          ChangeNotifierProvider(
            create: (context) => FoodService()
          ),
          ChangeNotifierProvider(
            create: (context) => JokeService()
            )
      ],
      child: const MaterialApp(
        title: "Splash Screen",
        debugShowCheckedModeBanner: false,
        // debugShowMaterialGrid: false,
        home: Splash(),
      ),
    )
  );
}

