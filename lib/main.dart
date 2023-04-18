import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_vendor/views/buyers/main_screen.dart';

//! [3] bottom_navigation
//* go to analysis_options => comment both include && linter
//* we can get our fonts from => fonts.google.com our any fonts website
//? we can use svg instead icons
void main() {
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
      home: const MainScreen(),
    );
  }
}
