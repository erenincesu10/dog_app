import 'package:dog_app/app/presentation/home/home_view.dart';
import 'package:dog_app/app/presentation/home/widgets/home_appbar.dart';
import 'package:dog_app/app/presentation/main/bloc/main_bloc.dart';
import 'package:dog_app/app/presentation/main/widgets/bottom_bar.dart';
import 'package:dog_app/app/presentation/main/widgets/custom_textfield.dart';
import 'package:dog_app/app/presentation/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: const HomeAppbar(),
          body: Stack(
            children: [
              state.selectedIndex == 0
                  ? const HomeView()
                  : const SettingsView(),
              state.selectedIndex == 0
                  ? const CustomTextField()
                  : const SizedBox(),
            ],
          ),
          bottomNavigationBar: const BottomBarWidget(),
        );
      },
    );
  }
}
