import 'package:flutter/material.dart';
import 'package:flutter_application_login_palakkad/view/loginscreen/login_screen.dart';
import 'package:flutter_application_login_palakkad/viewmodel/login_page/loginrepo/loginrepo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.fcm});

  final String fcm;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FutureBuilder(
            future: LoginRepository().requestNotificationPermission(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Some Error found');
              }

              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Fcm Key',
                      style: TextStyle(
                          color: Color.fromARGB(255, 19, 1, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        snapshot.data! != null
                            ? snapshot.data!
                            : "Nothing Found",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      child: Icon(Icons.logout),
                      onPressed: () async {
                        final storage = FlutterSecureStorage();
                        await storage.delete(key: 'token').then((value) {
                          print('Token deleted');
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignPage()));
                        });

                        final boo = await storage.containsKey(key: 'token');
                        final item = await storage.read(key: 'token');
                        print('Token still exists: $boo : $item');
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 23, 18, 2))),
                    )
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
