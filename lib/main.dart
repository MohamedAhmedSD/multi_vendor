import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'views/auth/register_screen.dart';

//! [13] auth_controller
//* go to analysis_options => comment both include && linter
//* we can get our fonts from => fonts.google.com our any fonts website
//? we can use svg instead icons
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //! it different according device we want to test it
    //? android, web, ...
    // options: DefaultFirebaseOptions.currentPlatform,
    options: DefaultFirebaseOptions.android,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //! how hide status bar == contain net, battary
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multi_vendor App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //! change font family
        fontFamily: "Brand-Bold",
      ),
      home: const RegisterScreen(),
    );
  }
}
