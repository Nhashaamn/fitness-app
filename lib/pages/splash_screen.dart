import 'dart:async';

import 'package:final_project/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) {
          return const Login();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Column(
        children: [
          Center(child: Image.asset("assets/hhh fitness.png")),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: LoadingAnimationWidget.stretchedDots(
                color: Colors.white, size: 100),
          )
        ],
      ),
    );
  }
}

class SecondScreen {
  const SecondScreen();
}
