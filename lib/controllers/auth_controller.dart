import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //! save users to cloud
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUsers(String email, String fullName, String phoneNumber,
      String password) async {
    //? posible error
    String res = "Some error occured";
    try {
      if (email.isNotEmpty &&
          fullName.isNotEmpty &&
          phoneNumber.isNotEmpty &&
          password.isNotEmpty) {
        //* create the users

        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        //! save users to cloud
        await _firestore.collection('buyers').doc(cred.user!.uid).set({
          'email': email,
          "fullName": fullName,
          "phoneNumber": phoneNumber,
          //? extra fields to make user update its data
          //! delete first old auth && collection we update its fields
          "buyerId": cred.user!.uid,
          "address": "",
        });

        res = "success";
      } else {
        res = "Please fields must not be empty";
      }
    } catch (e) {}
    return res;
  }
}
