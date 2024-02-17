import 'package:dog_app/app/core/constants/color_constant.dart';
import 'package:dog_app/app/core/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late DragStartDetails startVerticalDragDetails;
  late DragUpdateDetails updateVerticalDragDetails;
  double containerHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dy > 10) {
          setState(() {
            containerHeight = 100;
          });
        } else if (details.delta.dy < -5) {
          setState(() {
            containerHeight = 500;
          });
        }
      },
      child: Center(
        child: SizedBox(
          width: containerHeight > 200 ? context.width :  context.width * 0.8,
          height: containerHeight,
          child: TextField(
            onTap: () {
              setState(() {
                containerHeight = 200;
              });
            },
            onTapOutside: (event) {
              print(event.position.dy);
              if (event.position.dy > 100) {
                setState(() {
                  containerHeight = 100;
                });
              }
            },
            onSubmitted: (String a) {
              setState(() {
                containerHeight = 200;
              });
            },
            cursorColor: ColorConstant.cTextBlue,
            expands: true,
            maxLines: null,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              
              hintText: "Search",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: ColorConstant.cBorderGray,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: ColorConstant.cBorderGray,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: ColorConstant.cBorderGray,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: ColorConstant.cBorderGray,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
