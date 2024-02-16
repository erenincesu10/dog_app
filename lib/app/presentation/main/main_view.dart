import 'package:dog_app/app/core/constants/color_constant.dart';
import 'package:dog_app/app/core/extensions/build_context_extensions.dart';
import 'package:dog_app/app/presentation/home/home_view.dart';
import 'package:dog_app/app/presentation/home/widgets/home_appbar.dart';
import 'package:dog_app/app/presentation/main/bloc/main_bloc.dart';
import 'package:dog_app/app/presentation/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<MainBloc>();
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const HomeAppbar(),
          body: state.selectedIndex == 0
              ? const HomeView()
              : const SettingsView(),
          bottomNavigationBar: Container(
            width: context.width,
            height: context.height * 0.12,
            decoration: BoxDecoration(
              color: ColorConstant.primaryColor,
              border: Border.all(width: 2, color: ColorConstant.cBorderGray),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    bloc.add(const SelectIndexEvent(selectedIndex: 0));
                  },
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          bloc.add(const SelectIndexEvent(selectedIndex: 0));
                        },
                        icon: Image.asset(state.selectedIndex == 0
                            ? 'assets/icons/img_home.png'
                            : 'assets/icons/img_home_unselected.png'),
                      ),
                      Text(
                        "Home",
                        style: TextStyle(
                            color: state.selectedIndex == 0
                                ? ColorConstant.cTextBlue
                                : Colors.black),
                      ),
                    ],
                  ),
                ),
                const VerticalDivider(
                  width: 2,
                  indent: 24,
                  endIndent: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        bloc.add(const SelectIndexEvent(selectedIndex: 1));
                      },
                      icon: Image.asset(state.selectedIndex == 1
                          ? 'assets/icons/img_settings.png'
                          : 'assets/icons/img_settings_unselected.png'),
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(
                          color: state.selectedIndex == 1
                              ? ColorConstant.cTextBlue
                              : Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
