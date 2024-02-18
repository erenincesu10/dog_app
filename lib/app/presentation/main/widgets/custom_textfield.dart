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
            if (state.textfieldStatus != 0) {
              if (details.delta.dy > 10) {
                bloc.add(
                  const ChangeTextFieldStatusEvent(textfieldStatus: 1),
                );
              } else if (details.delta.dy < -5) {
                bloc.add(
                  const ChangeTextFieldStatusEvent(textfieldStatus: 2),
                );
              }
            }
          },
          child: Center(
            child: SizedBox(
              width: state.textfieldStatus != 0
                  ? context.width
                  : context.width * 0.8,
              height: state.textfieldStatus == 0
                  ? 60
                  : state.textfieldStatus == 1
                      ? 110
                      : context.height * 0.5465,
              child: Align(
                alignment: Alignment.topCenter,
                child: TextField(
                  controller: bloc.searchController,
                  onTap: () {
                    bloc.add(
                      const ChangeTextFieldStatusEvent(textfieldStatus: 1),
                    );
                  },
                  // onTapOutside: (event) {
                  //   print(event.position.dy);
                  //   if (event.position.dy > 100) {
                  //     setState(() {
                  //       containerHeight = 100;
                  //     });
                  //   }
                  // },
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
                  cursorColor: ColorConstant.cTextBlue,
                  expands: true,
                  maxLines: null,
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
          ),
        );
      },
    );
  }
}
