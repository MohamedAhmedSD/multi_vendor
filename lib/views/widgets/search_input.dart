import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multi_vendor/core/constants.dart';

class SearchInputWidget extends StatelessWidget {
  const SearchInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: TextField(
          decoration: InputDecoration(
            fillColor: AppColors.searchInputColor,
            filled: true,
            hintText: AppText.search_text,
            border: OutlineInputBorder(borderSide: BorderSide.none),
            //! add search icon, with padding
            prefixIcon: Padding(
              padding: const EdgeInsets.all(14.0),
              child: SvgPicture.asset(
                AppImages.search,
                width: 10,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
