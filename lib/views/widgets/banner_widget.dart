import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:multi_vendor/core/constants.dart';

class BannerWidget extends StatefulWidget {
  BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

//! avoid error when run image from internet
//* flutter run -d chrome --web-renderer html
//? https://stackoverflow.com/questions/65872585/flutter-cant-load-image-from-url

class _BannerWidgetState extends State<BannerWidget> {
  //? bring bannars from firebase
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //* make empty list to add images on it
  final List _bannerImage = [];

  //? make method, and call it inside init
  getBannars() {
    //* call data from collection on cloud firestore
    return _firestore
        .collection("banners") //! same to our collection folder
        .get()
        .then((QuerySnapshot querySnapshot) {
      //! data as snapshot
      //* loop through it == docs
      querySnapshot.docs.forEach((doc) {
        setState(() {
          //! add to list item on certain doc field
          _bannerImage.add(doc['image']);
        });
      });
    });
  }

  @override
  void initState() {
    getBannars();
    super.initState();
  }

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
          //! change page view into PageView.builder
          child:
              // PageView(
              //   children: [
              //     Center(
              //       child: Text("Banner 1"),
              //     ),
              //     Center(
              //       child: Text("Banner 2"),
              //     ),
              //     Center(
              //       child: Text("Banner 3"),
              //     ),
              //   ],
              // ),
              PageView.builder(
            itemCount: _bannerImage.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    _bannerImage[index],
                    fit: BoxFit.cover,
                  ));
            },
          ),
        ));
  }
}
