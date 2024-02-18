import 'package:dog_app/app/core/constants/color_constant.dart';
import 'package:dog_app/app/core/extensions/build_context_extensions.dart';
import 'package:dog_app/app/presentation/main/bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    var bloc = context.read<MainBloc>();
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Container(
          width: context.width,
          height: context.height * 0.12,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/img_tab.png')),
            color: Colors.transparent,
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
                indent: 4,
                endIndent: 30,
              ),
              Column(
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
        );
      },
    );
  }
}
