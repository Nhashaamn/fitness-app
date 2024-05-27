import 'dart:async';

import 'package:final_project/modules/count_down.dart';
import 'package:final_project/pages/rest/rest5.dart';
import 'package:flutter/material.dart';

class Russian extends StatefulWidget {
  const Russian({super.key});


  @override
  State<Russian> createState() => _RussianState();
}

class _RussianState extends State<Russian> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 30), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Rest5()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 30,),
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            
            decoration:  const BoxDecoration(image: DecorationImage(
              image: AssetImage("assets/russian.jpg"), // Use provided image path
              fit: BoxFit.cover, // Ensure image fills the container
            ),),
          ),
          const SizedBox(height: 50),
           const Text("RUSSIAN TWIST",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          const SizedBox(height: 20),
          const CountdownTimer(durationSeconds: 30,timerColor: Color.fromARGB(255, 0, 0, 0)),
        ],
      ),
    );
  }
}
