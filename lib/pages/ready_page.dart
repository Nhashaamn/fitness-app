import 'package:final_project/pages/loading_page.dart';
import 'package:flutter/material.dart';

// Loading page

// Ready page
class Ready extends StatelessWidget {
  const Ready({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background image with reduced opacity
          Opacity(
            opacity: 1, // Adjust the opacity as needed
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/gym.jpg'), // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Other widgets on top of the background image
          const Align(
            alignment: Alignment(0, 0.5),
            child: Text(
              'Are You Ready',
              style: TextStyle(
                  fontSize: 50,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: 'arial'),
            ),
          ),
          // Yes button
          Align(
            alignment: const Alignment(0, 0.7),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Loading()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Rounded edges
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              ),
              child: const Text(
                'Yes',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
