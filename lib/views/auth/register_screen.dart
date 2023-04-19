import 'package:flutter/material.dart';
import 'package:multi_vendor/controllers/auth_controller.dart';

import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  //! use auth controller, onchanged and call function
  final AuthController _authController = AuthController();
  late String email, fullName, phoneNumber, password;
  //* we make method signUp use that method inside auth controller
  _signUpUser() async {
    String res = await _authController.signUpUsers(
        email, fullName, phoneNumber, password);

    if (res != "success") {
      print(res);
    } else {
      print("Good");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
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
                decoration: InputDecoration(
                  labelText: "Enter Email",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(13),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter Full Name",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(13),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter Phone Number",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(13),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                ),
              ),
            ),
            //! button
            Container(
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
      )),
    );
  }
}
