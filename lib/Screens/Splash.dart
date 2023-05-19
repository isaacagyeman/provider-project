import 'dart:async';
import 'package:flutter/material.dart';
import 'package:providerproject/Screens/LoginPage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 7),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: ((context) => const LoginPage()))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.blue
        ),
        child:  const Center(
          child:  Text("HOLA MUNDO",
          textAlign: TextAlign.center, 
          style: TextStyle(
            fontSize: 20.0,
            fontWeight:FontWeight.w500,
          ),
          ),
        ),
      ),
    );
  }
}
