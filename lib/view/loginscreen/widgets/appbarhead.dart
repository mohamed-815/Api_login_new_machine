import 'package:flutter/material.dart';

class AppHeading extends StatelessWidget {
  AppHeading({
    required this.text,
    Key? key,
  }) : super(key: key);

  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
    );
  }
}

class AppHeadingblack extends StatelessWidget {
  AppHeadingblack({
    required this.text,
    Key? key,
  }) : super(key: key);

  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
    );
  }
}
