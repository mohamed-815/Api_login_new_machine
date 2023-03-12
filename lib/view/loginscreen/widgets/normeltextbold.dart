import 'package:flutter/material.dart';
import 'package:flutter_application_login_palakkad/core/const/const.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class NormalTextBold extends StatelessWidget {
  NormalTextBold({
    required this.text,
    Key? key,
  }) : super(key: key);

  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}

class CustomBoldText extends StatelessWidget {
  CustomBoldText({
    required this.text,
    Key? key,
  }) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 11, color: Colors.black),
        ),
      ],
    );
  }
}

class TabText extends StatelessWidget {
  TabText({
    required this.text,
    Key? key,
  }) : super(key: key);

  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 17.h),
      child: Text(
        text,
        style: TextStyle(color: Color.fromARGB(255, 11, 11, 11), fontSize: 11),
      ),
    );
  }
}
