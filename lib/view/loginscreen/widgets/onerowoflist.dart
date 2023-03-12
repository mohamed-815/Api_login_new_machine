import 'package:flutter/material.dart';
import 'package:flutter_application_login_palakkad/view/loginscreen/widgets/normeltextbold.dart';

class EmployDetailRow extends StatelessWidget {
  EmployDetailRow({
    required this.text1,
    required this.text2,
    Key? key,
  }) : super(key: key);

  String text1;
  String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NormalTextBold(text: text1),
          NormalTextBold(text: text2),
        ],
      ),
    );
  }
}
