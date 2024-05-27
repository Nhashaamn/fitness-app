import 'package:final_project/pages/work/plank.dart';
import 'package:flutter/material.dart';
import 'package:final_project/modules/count_down.dart'; // Ensure this import is correct

class Rest5 extends StatefulWidget {
  const Rest5({super.key});

  @override
  State<Rest5> createState() => _Rest5State();
}

class _Rest5State extends State<Rest5> {
  @override
  void initState() {
    super.initState();
    // Delay for 10 seconds and then navigate to the next page
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Plank()), // Replace with your next page widget
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


