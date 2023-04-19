import 'package:flutter/material.dart';
import 'package:multi_vendor/controllers/auth_controller.dart';

import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  //! use auth controller, onchanged and call function
  final AuthController _authController = AuthController();
  late String email, fullName, phoneNumber, password;
  //* we make method signUp use that method inside auth controller

  // _signUpUser() async {
  //   String res = await _authController.signUpUsers(
  //       email, fullName, phoneNumber, password);

  //   if (res != "success") {
  //     print(res);
  //   } else {
  //     print("Good");
  //   }
  // }

  _signUpUser() async {
    if (_formkey.currentState!.validate()) {
      await _authController.signUpUsers(email, fullName, phoneNumber, password);
    } else {
      print("hmm bad guy you are so wrong");
    }
  }
  //! use signup with validator

  //! use form with its key,
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Create Customer's Account",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 16,
              ),
              CircleAvatar(
                radius: 64,
                backgroundColor: Colors.yellow.shade900,
              ),
              Padding(
                padding: EdgeInsets.all(13),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please email must not be empty";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                    labelText: "Enter Email",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(13),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please name must not be empty";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    fullName = value;
                  },
                  decoration: InputDecoration(
                    labelText: "Enter Full Name",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(13),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please phone number must not be empty";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    phoneNumber = value;
                  },
                  decoration: InputDecoration(
                    labelText: "Enter Phone Number",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(13),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please password must not be empty";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                ),
              ),
              //! button
              GestureDetector(
                onTap: () {
                  _signUpUser();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade900,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }),
                      );
                    },
                    child: Text("Login"),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
