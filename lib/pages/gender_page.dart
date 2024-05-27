// ignore_for_file: use_super_parameters

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'weight_page.dart';

class Gender extends StatefulWidget {
  const Gender({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
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
        _container2Color = const Color.fromARGB(255, 0, 0, 0);
      } else {
        _container2Color =
            _container2Color == const Color.fromARGB(255, 0, 0, 0)
                ? const Color.fromARGB(255, 255, 255, 255)
                : const Color.fromARGB(255, 0, 0, 0);
        _container1Color = const Color.fromARGB(255, 0, 0, 0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Stack(
          children: [
            Opacity(
              opacity: 1,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/gym8.jpg'),
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
                    "  Welcome",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffE04754)),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "  Select your Gender",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1C6985)),
                  ),
                ),
                const SizedBox(
                  height: 250,
                ),
                GestureDetector(
                  onTap: () async {
                    _changeColor(1);
                    await db
                        .collection("data")
                        .doc(widget.name)
                        .set({'Gender': 'Male'});
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                          color: _container1Color.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: const Color(0xff1C6985), width: 2)),
                      child: const Align(
                        alignment: Alignment.bottomLeft,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Male",
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffE04754)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    _changeColor(2);
                    await db
                        .collection("data")
                        .doc(widget.name)
                        .set({'Gender': 'Female'});
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                          color: _container2Color.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: const Color(0xff1C6985), width: 2)),
                      child: const Align(
                        alignment: Alignment.bottomLeft,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Female",
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffE04754)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Weight(name2: widget.name)),
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
                            top: 10, bottom: 10, left: 20, right: 20),
                        child: Text("Next"),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
