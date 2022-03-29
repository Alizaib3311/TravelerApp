import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/feed.dart';
import 'package:frontend/login.dart';
import 'package:frontend/pwreset.dart';
import 'package:frontend/Login_Model';
import 'package:frontend/travel_nav.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'User.dart';

// Future<UserModel?> Login(String email, String password) async {
//   final Uri apiUrl = Uri.parse("http://192.168.100.47:3000/v1/auth/login");
//
//   final response = await http.post(apiUrl, body: {
//     "email": email,
//     "password": password,
//   });
//
//   if (response.statusCode == 200) {
//     final String responseString = response.body;
//
//     return userModelFromJson(responseString);
//   } else {
//     //final <Map>String error="error"
//     return null;
//   }
// }

class MyLogin1 extends StatefulWidget {
  const MyLogin1({Key? key}) : super(key: key);

  @override
  _MyLogin1State createState() => _MyLogin1State();
}

class _MyLogin1State extends State<MyLogin1> {
  // late final UserModel? User;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _userEmail = '';
  String _password = '';
  bool _isLoading = false;
  void _trySubmitForm() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      print(_userEmail);

      print(_password);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Log in'),
          centerTitle: true,
          backgroundColor: Colors.black87,
        ),

        //  _isLoading ? Center(child: CircularProgressIndicator()):
        body: Center(
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 35,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MyLogin1()),
                                        );
                                      },
                                      child: const Text('Facebook'),
                                      style: ElevatedButton.styleFrom(
                                        alignment: Alignment.center,
                                        primary: Colors.black87,
                                        onPrimary: Colors.white,
                                        padding: const EdgeInsets.all(20.0),
                                        minimumSize: const Size(180, 50),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ))),
                              Expanded(
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MyLogin1()),
                                        );
                                      },
                                      child: const Text('Gmail'),
                                      style: ElevatedButton.styleFrom(
                                        alignment: Alignment.center,
                                        primary: Colors.black87,
                                        onPrimary: Colors.white,
                                        padding: const EdgeInsets.all(20.0),
                                        minimumSize: const Size(180, 50),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ))),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  /////////////////////////////////////////
                                  /// Eamil
                                  Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Enter Credentials',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      )),

                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                    ),
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        return 'Please enter your email address';
                                      }
                                      // Check if the entered email has the right format
                                      if (!RegExp(r'\S+@\S+\.\S+')
                                          .hasMatch(value)) {
                                        return 'Please enter a valid email address';
                                      }
                                      // Return null if the entered email is valid
                                      return null;
                                    },
                                    onChanged: (value) => _userEmail = value,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),

                                  /////////////////////////////////////////
                                  /// username

                                  ////////////////////////////////////
                                  /// Password
                                  TextFormField(
                                    controller: pwController,
                                    decoration:
                                        InputDecoration(labelText: 'Password'),
                                    obscureText: true,
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        return 'This field is required';
                                      }
                                      if (value.trim().length < 8) {
                                        return 'Password must be at least 8 characters in length';
                                      }
                                      // Return null if the entered password is valid
                                      return null;
                                    },
                                    onChanged: (value) => _password = value,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),

                                  Container(
                                    alignment: const Alignment(1.0, 0.0),
                                    padding: const EdgeInsets.only(
                                        top: 15.0, left: 20.0),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Password()),
                                        );
                                      },
                                      child: const Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat',
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 35,
                                  ),

                                  // emailController.text == "" ||pwController.text == ""? null :

                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 40.0,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.0),
                                    margin: EdgeInsets.only(top: 15.0),
                                    child: ElevatedButton(
                                      onPressed: emailController.text == "" ||
                                              pwController.text == ""
                                          ? null
                                          : () {
                                              _trySubmitForm();
                                              setState(() {
                                                _isLoading = true;
                                              });
                                              signIn(emailController.text,
                                                  pwController.text);
                                            },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.black),
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                      ),
                                      child: Text("Sign In",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      // shape: RoundedRectangleBorder(
                                      //     borderRadius:
                                      //         BorderRadius.circular(5.0)),
                                    ),
                                  ),

                                  // Container(
                                  //   width: 300.0,
                                  //   height: 50.0,
                                  //   child: OutlinedButton(
                                  //     child: Text('Log In'),
                                  //     style: OutlinedButton.styleFrom(
                                  //       primary: Colors.white,
                                  //       backgroundColor: Colors.black,
                                  //       shape: const RoundedRectangleBorder(
                                  //           borderRadius: BorderRadius.all(
                                  //               Radius.circular(10))),
                                  //     ),
                                  //     onPressed: emailController.text == "" ||
                                  //             pwController.text == ""
                                  //         ? null
                                  //         : () {
                                  //             setState(() {
                                  //               _isLoading = true;
                                  //             });
                                  //             signIn(emailController.text,
                                  //                 pwController.text);
                                  //           },
                                  //   ),
                                  //
                                  //   // onPressed: () async {
                                  //   //   _trySubmitForm();
                                  //   //
                                  //   //   final String email = emailController.text;
                                  //   //   final String password = pwController.text;
                                  //   //   final UserModel? user =
                                  //   //       await Login(email, password);
                                  //   //   setState(() {
                                  //   //     _isLoading = true;
                                  //   //     //User = user;
                                  //   //   });
                                  //   //
                                  //   //   Navigator.push(
                                  //   //     context,
                                  //   //     MaterialPageRoute(
                                  //   //         builder: (context) => const MyFeed()),
                                  //   //   );
                                  //   //
                                  //   // }),
                                  // ),
                                  const SizedBox(
                                    height: 5,
                                  ),

                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 15.0, left: 20.0),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MyLogin()),
                                        );
                                      },
                                      child: const Text(
                                        "Don't have an account?",
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat',
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ));
  }

  signIn(String email, pass) async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'email': email, 'password': pass};
    var jsonResponse = null;
    var response = await http.post(
        Uri.parse("https://tourcotics.herokuapp.com/v1/auth/login"),
        // Uri.parse("http://192.168.100.47:3000/v1/auth/login"),
        body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });

        // print(jsonResponse.toString());

        //sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => MyFeed()),
            (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }
}
