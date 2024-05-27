// ignore_for_file: use_super_parameters, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:loading_animation_widget/loading_animation_widget.dart';

class CountdownTimer extends StatefulWidget {
  final Color timerColor;
  final int durationSeconds;

  const CountdownTimer({Key? key, required this.timerColor, required this.durationSeconds}) : super(key: key);

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> with TickerProviderStateMixin {
  late AnimationController _controller;
  late int _remainingTime;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.durationSeconds;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _remainingTime),
    )..addListener(() {
        setState(() {});
      });
    _controller.forward();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Text(
              '${_remainingTime}s',
              style: TextStyle(fontSize: 50, color: widget.timerColor),
            );
          },
        ),
        const SizedBox(height: 20),
        LoadingAnimationWidget.hexagonDots(color: widget.timerColor, size: 100)
      ],
    );
  }
}
