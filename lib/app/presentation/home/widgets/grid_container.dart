// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:ui';

import 'package:dog_app/app/core/constants/color_constant.dart';
import 'package:dog_app/app/presentation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

import 'package:dog_app/app/core/extensions/build_context_extensions.dart';
import 'package:dog_app/app/presentation/home/widgets/alert_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GridContainer extends StatelessWidget {
  final File imageUrl;
  final String name;
  final int index;
  const GridContainer({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            bloc.add(
              SetSelectedIndexEvent(selectedIndex: index),
            );
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => const AlertContainer());
          },
          child: Container(
            width: context.width * 0.3,
            height: context.width * 0.3,
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(imageUrl),
                fit: BoxFit.cover,
              ),
              color: ColorConstant.primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: IntrinsicWidth(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    height: context.height * 0.05,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.24),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      name,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    )),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
