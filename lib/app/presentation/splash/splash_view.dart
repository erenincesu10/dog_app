import 'package:dog_app/app/core/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: context.width,
          height: context.height,
          child: Center(
            child: Container(
              width: context.width * 0.2,
              height: context.width * 0.2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/icons/img_appicon.png",
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
