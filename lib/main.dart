import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_login_palakkad/view/loginscreen/login_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp().then((value) => print("rjrjr"));
  } catch (e) {
    print(e);
    print("EEJEJEJ");
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SignPage(),
            theme: ThemeData(),
          );
        });
  }
}
