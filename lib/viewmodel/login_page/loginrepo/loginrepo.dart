import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_application_login_palakkad/core/const/const.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginRepository {
  final String apiUrl = 'https://sukhprasavam.shebirth.com/login/';
  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  Future<String> getToken(String email, String password) async {
    // Send a POST request with email and password in the request body
    final response = await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    // Check if the request was successful
    if (response.statusCode == 200) {
      // Parse the response and extract the token
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final String token = responseData['token'];

      // Return the token
      return token;
    } else {
      // Throw an error
      return '';
    }
  }

  Future<String?> requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      String? fcmToken = await messaging.getToken(
          vapidKey:
              'BFMw-zuTSe1q9TewLeN6FeyWctsEM2k6TUT0BL6GQxybJZks9cxyK6nwanb9FIydtdijE15jag9uy-YvG7EwemA');
      // Send the FCM token to your server or store it in local storage

      return fcmToken;
    }
  }

  Future<String?> readingStorage() async {
    final readedtoken = await NewStorage().storage.read(key: 'token');
    return readedtoken;
  }
}
