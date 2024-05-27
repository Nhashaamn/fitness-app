// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  const Box({super.key,required this.height,required this.text,required this.color});

  final height ;
  final String text;
  final color;

  @override
  Widget build(BuildContext context) {
    return Container(
                height: height,
                width: MediaQuery.of(context).size.width - 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color:color)),
                child:  Text(
                  text,
                  style:  TextStyle(
                      color:color,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              );
  }
}