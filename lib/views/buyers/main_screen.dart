import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_vendor/core/constants.dart';
import 'package:multi_vendor/views/buyers/nav_screens/account_screen.dart';
import 'package:multi_vendor/views/buyers/nav_screens/cart_screen.dart';
import 'package:multi_vendor/views/buyers/nav_screens/category_screen.dart';
import 'package:multi_vendor/views/buyers/nav_screens/home_screen.dart';
import 'package:multi_vendor/views/buyers/nav_screens/search_screen.dart';
import 'package:multi_vendor/views/buyers/nav_screens/store_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

//* use Bottom_Navigtion_bar with svg icons
//* it part from Scaffold attribute
//? SvgPicture.asset(..., width),

int _pageIndex = 0;

//? add screens on list of widget
//* becarful with organization
List<Widget> _pages = [
  HomeScreen(),
  CategoryScreen(),
  StoreScreen(),
  CartScreen(),
  SearchScreen(),
  AccountScreen(),
];

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        //! better tu use with =>
        //* itesms, selectedItemColor, unselectedItemColor
        //* currentIndex, onTap, type

        //? to unable icons move horizontally
        type: BottomNavigationBarType.fixed,
        currentIndex: _pageIndex,
        onTap: (value) {
          //! don't forget setState
          setState(() {
            _pageIndex = value;
          });
        },
        selectedItemColor: AppColors.selectedItemColor,
        unselectedItemColor: AppColors.unSelectedItemColor,
        items: [
          //! why color of svg not change
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppImages.explore,
              width: 20,
            ),
            label: AppText.explore_text,
            //! our try to change svg color
            activeIcon: SvgPicture.asset(
              AppImages.explore,
              colorFilter:
                  ColorFilter.mode(Colors.yellow.shade900, BlendMode.srcIn),
            ),
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.shop,
                width: 20,
              ),
              label: AppText.shop_Text),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.cart,
                width: 20,
              ),
              label: AppText.cart_text),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.search,
                width: 20,
              ),
              label: AppText.search_text),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.account,
                width: 20,
              ),
              label: AppText.account_text),
        ],
      ),

      //! connect between our body && screens
      body:
          // Center(
          //   child: Text("Main Screen"),
          // ),
          _pages[_pageIndex],
    );
  }
}
