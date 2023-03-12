import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.textcolor,
    required this.bordercolor,
    required this.text,
    required this.buttoncolor,
    this.fun,
    required this.h,
    required this.w,
    Key? key,
  }) : super(key: key);

  Color bordercolor;
  Color buttoncolor;
  String text;
  void Function()? fun;
  double h;
  double w;
  Color textcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h,
      width: w,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(buttoncolor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    side: BorderSide(color: bordercolor)))),
        onPressed: fun,
        child: Container(
          // padding: EdgeInsets.symmetric(horizontal: 80.w),
          child: Text(
            text,
            style: TextStyle(fontSize: 11, color: textcolor),
          ),
          // CustomBoldText(text: text)
        ),
      ),
    );
  }
}
