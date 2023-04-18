import 'package:flutter/material.dart';
import 'package:multi_vendor/core/constants.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 140,
        //! take all possible width with MQ
        // width: MediaQuery.of(context).size.width - 40, //? -40
        //! our use double.infinty with wrap container under padding
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.bannerColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: PageView(
          children: [
            Center(
              child: Text("Banner 1"),
            ),
            Center(
              child: Text("Banner 2"),
            ),
            Center(
              child: Text("Banner 3"),
            ),
          ],
        ),
      ),
    );
  }
}
