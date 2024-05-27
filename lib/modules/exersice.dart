import 'package:final_project/pages/beginner_page.dart';
import 'package:flutter/material.dart';

class Exercise extends StatelessWidget {
  final String imagePath; 
  final String text;// Added parameter for image path

  const Exercise({
    super.key,
    required this.imagePath,
    required this.text // Required parameter for image path
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  Beginner(text: text,imagePath: imagePath,)));// Added code to navigate to ExerciseDetail page
        },
        child: Container(
          height: 120,
          width: MediaQuery.of(context).size.width - 20,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3), // Adjust opacity for better visibility
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(imagePath), // Use provided image path
              fit: BoxFit.cover, // Ensure image fills the container
            ),
          ),
          child:  Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 32.0, // Adjust font size as needed
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255), // Clear text against background
              ),
            ),
          ),
        ),
      ),
    );
  }
}
