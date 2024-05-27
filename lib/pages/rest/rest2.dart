import 'package:final_project/pages/work/leg_raises.dart';
import 'package:flutter/material.dart';
import 'package:final_project/modules/count_down.dart'; // Ensure this import is correct

class Rest2 extends StatefulWidget {
  const Rest2({super.key});

  @override
  State<Rest2> createState() => _Rest2State();
}

class _Rest2State extends State<Rest2> {
  @override
  void initState() {
    super.initState();
    // Delay for 10 seconds and then navigate to the next page
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Leg()), // Replace with your next page widget
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
              "Take a rest",
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


