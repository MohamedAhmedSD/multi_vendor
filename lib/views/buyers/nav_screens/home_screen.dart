import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multi_vendor/views/widgets/search_input.dart';

import '../../../core/constants.dart';

//? text + cart
//* we need cart items on vertical plane, so wrap row under column
//! and making padding for column not row
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        //! how we use MQ to make responsive padding
        padding: EdgeInsets.only(
            //? top: MediaQuery.of(context).padding.top,
            top: MediaQuery.of(context).padding.top,
            left: 25,
            right: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //! add emojii, copy and paste
                //? https://emojipedia.org/
                Text(
                  "Btoox8 , What are you\n looking for 👀",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SvgPicture.asset(
                  AppImages.cart,
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            //! add Search bar
            SearchInputWidget(),
          ],
        ),
      ),
    );
  }
}
