// main.dart
import 'package:flutter/material.dart';
import 'package:frontend/User.dart';
import 'package:http/http.dart' as http;
//import 'package:getwidget/getwidget.dart';

Future<UserModel?> createUser(String name, String email, String password,
    String type, String city, String phone) async {
  final Uri apiUrl = Uri.parse("http://192.168.100.47:3000/v1/auth/register");

  final response = await http.post(apiUrl, body: {
    "name": name,
    "email": email,
    "password": password,
    "type": type,
    "city": city,
    "phone": phone,

    // "reg": reg
  });

  if (response.statusCode == 201) {
    final String responseString = response.body;

    return userModelFromJson(responseString);
  } else {
    //final <Map>String error="error"
    return null;
  }
}

class Signup_traveler extends StatelessWidget {
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
  String _city = '';
  String _phone = '';

  // This function is triggered when the user press the "Sign Up" button
  void _trySubmitForm() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      print('Everything looks good!');
      print(_userEmail);
      print(_userName);
      print(_password);
      print(_confirmPassword);
      print(_city);
      print(_phone);

      /* 
      for processing data in database or api calling 
      */
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Create Account as Traveler"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            // child: Padding(
            //   // padding: const EdgeInsets.all(10),
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /////////////////////////////////////////

                    // Container(
                    //   Row(
                    //     children: <Widget>[
                    //       Expanded(
                    //           child: ElevatedButton(
                    //               onPressed: () {
                    //                 Navigator.push(
                    //                   context,
                    //                   MaterialPageRoute(
                    //                       builder: (context) => const MyLogin1()),
                    //                 );
                    //               },
                    //               child: const Text('Facebook'),
                    //               style: ElevatedButton.styleFrom(
                    //                 alignment: Alignment.center,
                    //                 primary: Colors.black87,
                    //                 onPrimary: Colors.white,
                    //                 padding: const EdgeInsets.all(20.0),
                    //                 minimumSize: const Size(180, 50),
                    //                 shape: RoundedRectangleBorder(
                    //                     borderRadius: BorderRadius.circular(20)),
                    //               ))),
                    //       Expanded(
                    //           child: ElevatedButton(
                    //               onPressed: () {
                    //                 Navigator.push(
                    //                   context,
                    //                   MaterialPageRoute(
                    //                       builder: (context) => const MyLogin1()),
                    //                 );
                    //               },
                    //               child: const Text('Gmail'),
                    //               style: ElevatedButton.styleFrom(
                    //                 alignment: Alignment.center,
                    //                 primary: Colors.black87,
                    //                 onPrimary: Colors.white,
                    //                 padding: const EdgeInsets.all(20.0),
                    //                 minimumSize: const Size(180, 50),
                    //                 shape: RoundedRectangleBorder(
                    //                     borderRadius: BorderRadius.circular(20)),
                    //               ))),
                    //     ],
                    //   ),),
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40),
                        )),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Or Sign up with Email',
                          style: TextStyle(fontSize: 20),
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
                      decoration: InputDecoration(labelText: 'Name'),
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
                    SizedBox(height: 20),
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
                            _trySubmitForm();
                            final String name = nameController.text;
                            final String email = emailController.text;
                            final String phone = phoneController.text;
                            final String password = pwController.text;
                            final String city = cityController.text;
                            const String type = "1";
                            final UserModel? user = await createUser(
                                name, email, password, type, city, phone);

                            setState(() {
                              User = user;
                            });
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
