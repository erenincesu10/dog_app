import 'package:dog_app/app/core/constants/color_constant.dart';
import 'package:dog_app/app/core/extensions/build_context_extensions.dart';
import 'package:dog_app/app/presentation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late DragStartDetails startVerticalDragDetails;
  late DragUpdateDetails updateVerticalDragDetails;

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return GestureDetector(
          onPanUpdate: (details) {
            if (state.textfieldStatus == 2) {
              if (details.delta.dy > 5) {
                bloc.add(
                  const ChangeTextFieldStatusEvent(textfieldStatus: 1),
                );
                Future.delayed(const Duration(microseconds: 500));
              }
            } else if (state.textfieldStatus == 1) {
              if (details.delta.dy < -7) {
                bloc.add(
                  const ChangeTextFieldStatusEvent(textfieldStatus: 2),
                );
                Future.delayed(const Duration(microseconds: 500));
              } else if (details.delta.dy > 10.7 && details.delta.dy < 12) {
                bloc.add(
                  const ChangeTextFieldStatusEvent(textfieldStatus: 0),
                );
                bloc.focusNode.unfocus();
              }
            }
          },
          child: Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: state.textfieldStatus == 0
                  ? EdgeInsets.only(top: context.height * 0.6)
                  : EdgeInsets.zero,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              width: state.textfieldStatus != 0
                  ? context.width
                  : context.width * 0.8,
              height: state.textfieldStatus == 0
                  ? 60
                  : state.textfieldStatus == 1
                      ? context.height * 0.385
                      : context.height,
              child: TextField(
                controller: bloc.searchController,
                onTap: () {
                  bloc.add(
                    const ChangeTextFieldStatusEvent(textfieldStatus: 1),
                  );
                },
                onChanged: (value) {
                  bloc.add(
                    const SearchDogByNameEvent(),
                  );
                },
                onSubmitted: (String a) {
                  bloc.add(
                    const ChangeTextFieldStatusEvent(textfieldStatus: 0),
                  );
                },
                focusNode: bloc.focusNode,
                cursorColor: ColorConstant.cTextBlue,
                maxLines: 100,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Search",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: ColorConstant.cBorderGray,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: ColorConstant.cBorderGray,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: ColorConstant.cBorderGray,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: ColorConstant.cBorderGray,
                    ),
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
