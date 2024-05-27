import 'package:final_project/pages/rest/rest_page.dart';
import 'package:flutter/material.dart';

class Beginner extends StatefulWidget {
  const Beginner({super.key, required this.text, required this.imagePath});
  final String text;
  final String imagePath;

  @override
  State<Beginner> createState() => _BeginnerState();
}

class _BeginnerState extends State<Beginner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              image: DecorationImage(
                image: AssetImage(widget.imagePath), // Use provided image path
                fit: BoxFit.cover, // Ensure image fills the container
              ),
            ),
            child: Center(
              child: Text(
                widget.text,
                style: const TextStyle(
                  fontSize: 32.0, // Adjust font size as needed
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(
                      255, 255, 255, 255), // Clear text against background
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text(
                        "20 mins . 7 Workouts",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xffE04754)),
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Rest()));
                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            color: Colors.white),
                        child: const Center(
                            child: Text(
                          "START",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      image: const DecorationImage(
              image: AssetImage("assets/jump.jpg"), // Use provided image path
              fit: BoxFit.cover, // Ensure image fills the container
            ),
                    ),
                    child: const Center(
                        child: Text(
                      "JUMPING JACKS",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
                    )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      image: const DecorationImage(
              image: AssetImage("assets/russ.jpg"), // Use provided image path
              fit: BoxFit.cover, // Ensure image fills the container
            ),
                    ),
                    child: const Center(
                        child: Text(
                      "RUSSIAN TWIST",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
                    )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      image: const DecorationImage(
              image: AssetImage("assets/mount.jpg"), // Use provided image path
              fit: BoxFit.cover, // Ensure image fills the container
            ),
                    ),
                    child: const Center(
                        child: Text(
                      "MOUNTAIN CLIMBING",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
                    )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      image: const DecorationImage(
              image: AssetImage("assets/legr.jpg"), // Use provided image path
              fit: BoxFit.cover, // Ensure image fills the container
            ),
                      
                    ),
                    child: const Center(
                        child: Text(
                      "LEG RAISES",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
                    )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      image: const DecorationImage(
              image: AssetImage("assets/abdom.webp"), // Use provided image path
              fit: BoxFit.cover, // Ensure image fills the container
            ),
                    ),
                    child: const Center(
                        child: Text(
                      "ABDOMINAL CRUNCHES",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
                    )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      image: const DecorationImage(
              image: AssetImage("assets/planks.jpg"), // Use provided image path
              fit: BoxFit.cover, // Ensure image fills the container
            ),
                    ),
                    child: const Center(
                        child: Text(
                      "PLANK",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
                    )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      image: const DecorationImage(
              image: AssetImage("assets/cob.jpg"), // Use provided image path
              fit: BoxFit.cover, // Ensure image fills the container
            ),
                    ),
                    child: const Center(
                        child: Text(
                      "COBRA STRECH",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
                    )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
