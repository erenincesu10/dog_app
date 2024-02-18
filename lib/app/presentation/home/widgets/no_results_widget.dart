import 'package:flutter/material.dart';

class NoResultWidget extends StatelessWidget {
  const NoResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "No results found",
        ),
        Text(
          "Try searching with another word",
        ),
      ],
    );
  }
}
