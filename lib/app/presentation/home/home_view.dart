import 'package:dog_app/app/core/constants/color_constant.dart';
import 'package:dog_app/app/core/extensions/build_context_extensions.dart';
import 'package:dog_app/app/presentation/home/widgets/grid_container.dart';
import 'package:dog_app/app/presentation/home/widgets/home_appbar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppbar(),
      body: SizedBox(
        width: context.width,
        height: context.height,
        child: Stack(
          children: [
            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
              itemBuilder: (context, index) => GridContainer(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: context.width,
                height: context.height * 0.12,
                decoration: BoxDecoration(
                  color: ColorConstant.primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.home),
                    ),
                    const VerticalDivider(
                      width: 2,
                      indent: 24,
                      endIndent: 50,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.home),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
