// main.dart
import 'package:flutter/material.dart';
import 'package:frontend/User.dart';
//import 'package:getwidget/getwidget.dart';
import 'package:http/http.dart' as http;

import 'login1.dart';

Future<UserModel?> createUser(String name, String email, String password,
    String type, String city, String phone, String cnic) async {
  final Uri apiUrl =
      //Uri.parse("http://192.168.100.47:3000/v1/auth/registerAgency");
      Uri.parse("https://tourcotics.herokuapp.com/v1/auth/registerAgency");

  final response = await http.post(apiUrl, body: {
    "name": name,
    "email": email,
    "password": password,
    "type": type,
    "city": city,
    "phone": phone,
    "cnic": cnic
    // "reg": reg
  });

  if (response.statusCode == 201) {
    final String responseString = response.body;

    return userModelFromJson(responseString);
  } else {
    return null;
  }
}

class Signup_Agency extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final UserModel? User;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  // final TextEditingController regController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cnicController = TextEditingController();

  // Define a key to access the form
  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _userName = '';
  String _password = '';
  String _confirmPassword = '';
  String _cnic = '';
  String _RegNo = '';
  String _city = '';
  String _phone = '';

  // This function is triggered when the user press the "Sign Up" button
  bool _trySubmitForm() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      print(_userEmail);
      print(_userName);
      print(_password);
      print(_confirmPassword);
      print(_cnic);
      print(_RegNo);
      print(_city);
      print(_phone);

      /* 
      for processing data in database or api calling 
      */
    }

    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Create Account as travel Agency"),
        backgroundColor: Colors.black,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: Colors.white,
        //   ),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
        centerTitle: true,
      ),
      //  Container(
      //               alignment: Alignment.center,
      //               padding: EdgeInsets.all(10),
      //               child: Text(
      //                 'Sign in',
      //                 style: TextStyle(fontSize: 20),
      //               )),

      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Center(
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            // child: Padding(
            //   // padding: const EdgeInsets.all(10),
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /////////////////////////////////////////
                    /// Eamil
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Fill Information',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
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
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
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

                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: 'Username'),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'This field is required';
                        }
                        if (value.trim().length < 4) {
                          return 'Username must be at least 4 characters in length';
                        }
                        // Return null if the entered username is valid
                        return null;
                      },
                      onChanged: (value) => _userName = value,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: cityController,
                      decoration: InputDecoration(labelText: 'City'),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'This field is required';
                        }

                        // Return null if the entered username is valid
                        return null;
                      },
                      onChanged: (value) => _city = value,
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(labelText: 'Phone'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'This field is required';
                        }
                        if (value.trim().length < 11) {
                          return 'Phone num is not correct';
                        }
                        // Return null if the entered username is valid
                        return null;
                      },
                      onChanged: (value) => _phone = value,
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    ////////////////////////////////////
                    /// Password
                    TextFormField(
                      controller: pwController,
                      decoration: InputDecoration(labelText: 'Password'),
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
                    //////////////////////////////////
                    /// Confirm Password
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Confirm Password'),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }

                        if (value != _password) {
                          return 'Confimation password does not match the entered password';
                        }

                        return null;
                      },
                      onChanged: (value) => _confirmPassword = value,
                    ),
                    SizedBox(height: 5),
                    //CNIC
                    TextFormField(
                      controller: cnicController,
                      decoration: InputDecoration(labelText: 'CNIC'),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'This field is required';
                        }
                      },
                      onChanged: (value) => _cnic = value,
                    ),
                    SizedBox(height: 5),
                    //registration No
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Registration No'),
                      onChanged: (value) => _RegNo = value,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 300.0,
                      height: 50.0,
                      child: OutlinedButton(
                          child: Text('Sign Up'),
                          style: OutlinedButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.teal,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          onPressed: () async {
                            final String name = nameController.text;
                            final String email = emailController.text;
                            final String phone = phoneController.text;
                            final String password = pwController.text;
                            final String city = cityController.text;
                            final String cnic = cnicController.text;
                            const String type = "2";
                            final UserModel? user = await createUser(
                                name, email, password, type, city, phone, cnic);

                            setState(() {
                              User = user;
                            });

                            if (!_trySubmitForm()) {
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyLogin1()),
                              );
                            }
                          }),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
