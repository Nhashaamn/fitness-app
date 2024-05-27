import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/pages/height_page.dart';
import 'package:flutter/material.dart';

class Weight extends StatefulWidget {
  const Weight({super.key, required this.name2});
  final String name2;

  @override
  State<Weight> createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  final db = FirebaseFirestore.instance;

  Color _container1Color = const Color.fromARGB(255, 0, 0, 0);
  Color _container2Color = const Color.fromARGB(255, 0, 0, 0);

  void _changeColor(int containerNumber) {
    setState(() {
      if (containerNumber == 1) {
        _container1Color =
            _container1Color == const Color.fromARGB(255, 0, 0, 0)
                ? const Color.fromARGB(255, 255, 255, 255)
                : const Color.fromARGB(255, 0, 0, 0);
        _container2Color =
            const Color.fromARGB(255, 0, 0, 0); // Reset the second container
      } else {
        _container2Color =
            _container2Color == const Color.fromARGB(255, 0, 0, 0)
                ? const Color.fromARGB(255, 255, 255, 255)
                : const Color.fromARGB(255, 0, 0, 0);
        _container1Color =
            const Color.fromARGB(255, 0, 0, 0); // Reset the first container
      }
    });
  }

  String id = 'a';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Stack(
          children: [
            // Background image with reduced opacity
            Opacity(
              opacity: 1, // Adjust the opacity as needed
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/gym3.jpg'), // Replace with your image path
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
                    "  What you want to do",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1C6985),
                    ),
                  ),
                ),
                const SizedBox(height: 300),
                GestureDetector(
                  onTap: () async {
                    _changeColor(1);
                    db
                        .collection('data')
                        .doc(widget.name2)
                        .update({'Want': 'Loose weight'});
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                        color: _container1Color
                            .withOpacity(0.5), // Adjust the opacity here
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color(0xff1C6985), width: 2),
                      ),
                      child: const Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Lose Weight",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffE04754),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    _changeColor(2);
                    db
                        .collection('data')
                        .doc(widget.name2)
                        .update({'Want': 'Gain Muscle'});
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                        color: _container2Color
                            .withOpacity(0.5), // Adjust the opacity here
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color(0xff1C6985), width: 2),
                      ),
                      child: const Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Gain Muscles",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffE04754),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Height(name3: widget.name2)),
                    );
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffE04754),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left: 20,
                          right: 20,
                        ),
                        child: Text("Next"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
