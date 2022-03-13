import 'package:flutter/material.dart';
import 'package:frontend/First_Page.dart';
import 'package:frontend/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {'login': (context) => MyLogin()},
    );
  }
}
