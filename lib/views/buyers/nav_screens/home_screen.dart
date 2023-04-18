import 'package:flutter/material.dart';
import 'package:multi_vendor/views/widgets/banner_widget.dart';
import 'package:multi_vendor/views/widgets/categories_text.dart';
import 'package:multi_vendor/views/widgets/search_input.dart';
import 'package:multi_vendor/views/widgets/welcome_text.dart';

//? text + cart
//* we need cart items on vertical plane, so wrap row under column
//! and making padding for column not row
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          WelcomeText(),

          SizedBox(
            height: 14,
          ),
          //! add Search bar
          SearchInputWidget(),
          SizedBox(
            height: 14,
          ),
          //! banner
          BannerWidget(),
          //! categories titles
          CategoryText(),
        ],
      ),
    );
  }
}
