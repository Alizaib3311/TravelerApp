import 'package:flutter/material.dart';
import 'package:frontend/login.dart';
import 'package:frontend/login1.dart';

class MyHistory extends StatefulWidget {
  const MyHistory({Key? key}) : super(key: key);

  @override
  _MyprofileState createState() => _MyprofileState();
}

class _MyprofileState extends State<MyHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        title: const Text('History'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Center(child: Text("History")),
    );
  }
}
