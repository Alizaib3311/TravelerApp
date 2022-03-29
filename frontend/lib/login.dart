import 'package:flutter/material.dart';
import 'package:frontend/Signup_Traveler.dart';
import 'package:frontend/login1.dart';
import 'package:frontend/Signup_agency.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Signup_agency.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
//  late SharedPreferences sharedPreferences;

  // @override
  // void initState() {
  //   super.initState();
  //   checkLoginStatus();
  // }

  // checkLoginStatus() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   if (sharedPreferences.getString("token") == null) {
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(builder: (BuildContext context) => MyLogin1()),
  //         (Route<dynamic> route) => false);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/logins.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                Image.asset('assets/logos.png'),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyLogin1()),
                      );
                    },
                    child: const Text('SIGN IN'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black87,
                      onPrimary: Colors.white,
                      padding: const EdgeInsets.all(10.0),
                      minimumSize: const Size(300, 30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    )),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Signup_traveler()),
                      );
                    },
                    child: const Text('Are you a Traveller?'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black87,
                      onPrimary: Colors.white,
                      padding: const EdgeInsets.all(10.0),
                      minimumSize: const Size(300, 30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    )),
                const Text(
                  'OR',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Signup_Agency()),
                      );
                    },
                    child: const Text('Are you a Travel Agency?'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black87,
                      onPrimary: Colors.white,
                      padding: const EdgeInsets.all(10.0),
                      minimumSize: const Size(300, 30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    )),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
