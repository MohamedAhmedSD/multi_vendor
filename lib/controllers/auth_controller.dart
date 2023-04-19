import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signUpUsers(String email, String fullName, String phoneNumber,
      String password) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty &&
          fullName.isNotEmpty &&
          phoneNumber.isNotEmpty &&
          password.isNotEmpty) {
        //* create the users

        UserCredential _cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
      } else {
        res = "Please fields must not be empty";
      }
    } catch (e) {}
    return res;
  }
}
