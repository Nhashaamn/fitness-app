// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/pages/ready_page.dart';
import 'package:flutter/material.dart';

class Height extends StatefulWidget {
  const Height({super.key, required this.name3});
  final String name3;

  @override
  State<Height> createState() => _HeightState();
}

class _HeightState extends State<Height> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final db = FirebaseFirestore.instance;

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void validateAndSubmit() async {
    if (weightController.text.isEmpty || heightController.text.isEmpty) {
      showErrorDialog("Please enter both weight and height.");
      return;
    }

    try {
      await db.collection('data').doc(widget.name3).update({
        'Weight': weightController.text,
        'Height': heightController.text,
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Ready()),
      );
    } catch (e) {
      showErrorDialog("Failed to save data. Please try again.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 1,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/gym4.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 50),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "  Enter Your Weight & Height",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffE04754),
                  ),
                ),
              ),
              const SizedBox(height: 350),
              Align(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: weightController,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255)),
                    decoration: InputDecoration(
                      labelText: 'Enter Weight in kg',
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                            width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: heightController,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255)),
                    decoration: InputDecoration(
                      labelText: 'Enter Height in cm',
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                            width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: validateAndSubmit,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffE04754),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 20, right: 20),
                      child: Text("Next"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
