import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_vendor/controllers/auth_controller.dart';
import 'package:multi_vendor/utils/show_snack_bar.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //! use auth controller, onchanged and call function
  final AuthController _authController = AuthController();

  late String email, fullName, phoneNumber, password;
  //! pick up function
  pickProfileImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();

    XFile? _file = await _imagePicker.pickImage(source: source);

    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print("No Image selected");
    }
  }

  //! select image from gallery || camera
  bool _isLoading = false;
  Uint8List? _image;

  selectedGalleryImage() async {
    Uint8List im = await _authController.pickProfileImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  selectedCameraImage() async {
    Uint8List im = await _authController.pickProfileImage(ImageSource.camera);
    setState(() {
      _image = im;
    });
  }

  //* we make method signUp use that method inside auth controller

  _signUpUser() async {
    if (_formkey.currentState!.validate()) {
      await _authController.signUpUsers(email, fullName, phoneNumber, password);

      //! reset fields
      setState(() {
        _formkey.currentState!.reset();
        _isLoading = false;
      });
      return showSnack(
          context, "Congratulations Account has been created for you");
    } else {
      // print("hmm bad guy you are so wrong");
      setState(() {
        _isLoading = false;
      });

      return showSnack(context, "Please field must not be empty");
    }
  }

  //! use signup with validator
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
              //! use stack

              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundColor: Colors.yellow.shade900,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : CircleAvatar(
                          radius: 64,
                          backgroundColor: Colors.yellow.shade900,
                          backgroundImage: NetworkImage(
                              "https://www.citypng.com/public/uploads/preview/download-black-male-user-profile-icon-png-116371332534k5baafcll.png"),
                        ),
                  Positioned(
                    right: 0,
                    top: 5,
                    child: IconButton(
                      onPressed: () {
                        selectedGalleryImage();
                      },
                      icon: Icon(
                        Icons.photo_camera,
                        // color: Colors.white,
                      ),
                    ),
                  ),
                ],
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
