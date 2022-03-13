import 'package:flutter/material.dart';
import 'package:frontend/MyHistory.dart';
import 'package:frontend/login.dart';
import 'package:frontend/login1.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({Key? key}) : super(key: key);

  @override
  _MyprofileState createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      // appBar: AppBar(
      //   title: const Text('Profile'),
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      // ),
      body: Center(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: 115,
                    width: 115,
                    child: Stack(
                      fit: StackFit.expand,
                      children: const [
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/profile.png"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: const <Widget>[
                      Text(
                        "Unknown User",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Lahore,",
                          style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        Text(
                          " Pakistan",
                          style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ]),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Username",
                          style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        Text(
                          "Unknown",
                          style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ]),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Email",
                          style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        Text(
                          "Unknown",
                          style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ]),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Phone",
                          style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        Text(
                          "Unknown",
                          style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ]),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Date of Birth",
                          style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        Text(
                          "Unknown",
                          style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ]),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Address",
                          style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        Text(
                          "Unknown",
                          style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ]),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHistory()),
                        );
                      },
                      child: const Text(
                        'Visited Places',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        onPrimary: Colors.black87,
                        padding: const EdgeInsets.all(10.0),
                        minimumSize: const Size(180, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      )),
                  Container(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyLogin()),
                        );
                      },
                      child: const Text(
                        'Sign out',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
