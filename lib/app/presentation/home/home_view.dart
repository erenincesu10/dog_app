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
    return const Scaffold(
      appBar: HomeAppbar(),
      body: SizedBox(),
    );
  }
}
