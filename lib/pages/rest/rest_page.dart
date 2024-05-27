import 'package:final_project/pages/work/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:final_project/modules/count_down.dart'; // Ensure this import is correct

class Rest extends StatefulWidget {
  const Rest({super.key});

  @override
  State<Rest> createState() => _RestState();
}

class _RestState extends State<Rest> {
  @override
  void initState() {
    super.initState();
    // Delay for 10 seconds and then navigate to the next page
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Workout()), // Replace with your next page widget
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Column(
   
        children: [
          SizedBox(height: 200,),
          Center(
            child: Text(
              "READY",
              style: TextStyle(fontSize: 70, color: Colors.white),
            ),
          ),
          SizedBox(height: 50,),
          CountdownTimer(timerColor: Colors.white,durationSeconds: 10,),
        ],
      ),
    );
  }
}


