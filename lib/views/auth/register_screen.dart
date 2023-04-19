import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Create Customer's Account",
            style: TextStyle(fontSize: 20),
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
                labelText: "Enter Pgone Number",
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
            child: Text(
              "Register",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4),
            ),
          ),
        ],
      )),
    );
  }
}
