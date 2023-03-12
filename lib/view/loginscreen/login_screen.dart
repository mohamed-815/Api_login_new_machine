import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_login_palakkad/core/const/const.dart';
import 'package:flutter_application_login_palakkad/view/home_screen/home_screen.dart';
import 'package:flutter_application_login_palakkad/view/loginscreen/widgets/custombutton.dart';
import 'package:flutter_application_login_palakkad/view/loginscreen/widgets/normeltextbold.dart';
import 'package:flutter_application_login_palakkad/view/loginscreen/widgets/textformfield.dart';
import 'package:flutter_application_login_palakkad/viewmodel/login_page/loginrepo/loginrepo.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

class SignPage extends StatelessWidget {
  SignPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 2, 59, 105),
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 2, 59, 105),
          ),
          padding: EdgeInsets.fromLTRB(20, 200, 20, 200),
          child: Card(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Color.fromARGB(230, 255, 255, 255),
                  ),
                  height: 50,
                  child: TabBar(
                    indicatorColor: Color.fromARGB(149, 18, 143, 165),
                    tabs: [
                      Tab(
                        child: TabText(
                          text: "Sign In",
                        ),
                      ),
                      Tab(
                        child: TabText(
                          text: 'Sign Up',
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      signUpPage(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: Color.fromARGB(230, 255, 255, 255),
                        ),
                      ),
                    ],
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

class signUpPage extends StatefulWidget {
  signUpPage({
    Key? key,
  }) : super(key: key);

  @override
  State<signUpPage> createState() => _signUpPageState();
}

final formkey = GlobalKey<FormState>();
bool isError = false;

class _signUpPageState extends State<signUpPage> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: LoginRepository().readingStorage(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen(fcm: 'dd');
          }
          if (snapshot.hasError) {
            return Text('error found');
          } else {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Color.fromARGB(230, 255, 255, 255),
              ),
              child: Form(
                key: formkey,
                child: Column(children: [
                  khieght,
                  khieght,
                  khieght,
                  CustomBoldText(
                    text: "email",
                  ),
                  khieght,
                  TextFieldCustom(
                    password: false,
                    controller: emailcontroller,
                    text: "Input Your mobile no",
                    vlalidator: (value) {
                      if (value == null || value.isEmpty) {
                        isError = true;
                        return 'Please enter your email';
                      }
                      isError = false;
                      return null;
                    },
                  ),
                  khieght,
                  CustomBoldText(
                    text: "Password",
                  ),
                  khieght,
                  TextFieldCustom(
                    password: false,
                    controller: passwordcontroller,
                    text: "Input Your password",
                    vlalidator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  khieght,
                  khieght,
                  khieght,
                  CustomButton(
                    textcolor: Colors.black,
                    h: 27.h,
                    w: 270.w,
                    bordercolor: Color.fromARGB(141, 18, 140, 165),
                    text: "Sign in",
                    buttoncolor: Color.fromARGB(149, 18, 143, 165),
                    fun: () async {
                      if (formkey.currentState!.validate()) {
                        String? token = await LoginRepository().getToken(
                            emailcontroller.text.trim().toString(),
                            passwordcontroller.text.trim().toString());
                        // print('${token}.................');
                        if (token != '') {
                          //   print('${token}.................');
                          await NewStorage()
                              .storage
                              .write(key: 'token', value: token);
                          final readedtoken =
                              await NewStorage().storage.read(key: 'token');
                          //print(readedtoken);
                          if (readedtoken != '') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomeScreen(fcm: 'dd')));
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("some thing went wrong")));
                        }
                      } else {
//    If all data are not valid then start auto validation.
                      }
                    },
                  ),
                  khieght,
                ]),
              ),
            );
          }
        });
  }
}
