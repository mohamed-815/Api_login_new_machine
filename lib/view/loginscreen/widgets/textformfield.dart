import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

bool obstacure = true;

class TextFieldCustom extends StatefulWidget {
  TextFieldCustom(
      {required this.password,
      this.icon,
      this.text,
      required this.controller,
      super.key,
      this.vlalidator});
  TextEditingController controller;
  String? text;
  IconData? icon;
  bool password;
  final String? Function(String?)? vlalidator;

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  void _changeObstacure() {
    setState(() {
      obstacure = !obstacure;
      print(obstacure);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.vlalidator,
      obscureText: widget.password == true ? obstacure : false,
      controller: widget.controller,
      style: TextStyle(fontSize: 11),
      decoration: InputDecoration(
        suffixIcon: widget.password == true
            ? obstacure == true
                ? GestureDetector(
                    child: Icon(Icons.visibility_off),
                    onTap: _changeObstacure,
                  )
                : GestureDetector(
                    child: Icon(Icons.visibility),
                    onTap: _changeObstacure,
                  )
            : SizedBox(),
        hintText: widget.text,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Color.fromARGB(149, 18, 143, 165),
          ),
        ),
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.all(16),
      ),
    );
  }
}
