// ignore_for_file: use_build_context_synchronously

import 'package:final_project/modules/textfeild.dart';
import 'package:final_project/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {

  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  final db = FirebaseFirestore.instance;

  void signUserUp() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmpasswordController.text.isEmpty) {
      showErrorDialog("Please enter email and password");
      return;
    }

    if (passwordController.text != confirmpasswordController.text) {
      showErrorDialog("Passwords do not match");
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context); // Close the progress dialog
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // Close the progress dialog
      showErrorDialog(e.message ?? "An unknown error occurred");
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Image.asset(
                  "assets/hhh fitness.png",
                  height: 200,
                  width: 200,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return const Text(
                      'Image not found',
                      style: TextStyle(color: Colors.red),
                    );
                  },
                ),
                const SizedBox(height: 50),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Textfield(
                    Icon: const Icon(Icons.email, color: Color(0xffE04754)),
                    controller: emailController,
                    hintText: "Enter email",
                    obscureText: false,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Textfield(
                    Icon: const Icon(Icons.password, color: Color(0xffE04754)),
                    controller: passwordController,
                    hintText: "Enter password",
                    obscureText: true,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Textfield(
                    Icon: const Icon(Icons.password, color: Color(0xffE04754)),
                    controller: confirmpasswordController,
                    hintText: "Confirm password",
                    obscureText: true,
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: signUserUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffE04754),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                        color: Color(0xff1C6985),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  child: const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Already have an account?   ",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: "LogIn",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                            decorationThickness: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
