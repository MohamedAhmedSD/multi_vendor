import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        //! how we use MQ to make responsive padding
        padding: EdgeInsets.only(
            //? top: MediaQuery.of(context).padding.top,
            top: MediaQuery.of(context).padding.top,
            left: 25,
            right: 15),
        child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //! add emojii, copy and paste
          //? https://emojipedia.org/
          Text(
            // "Btoox8 , What are you\n looking for 👀",
            AppText.welcome_text,
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
    );
  }
}
