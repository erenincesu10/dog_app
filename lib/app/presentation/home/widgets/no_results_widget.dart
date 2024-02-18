import 'package:dog_app/app/core/constants/color_constant.dart';
import 'package:flutter/material.dart';

class NoResultWidget extends StatelessWidget {
  const NoResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "No results found",
          style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w600),
        ),
        Text(
          "Try searching with another word",
          style: TextStyle(
              fontSize: 16,
              color: ColorConstant.cTextGray,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
