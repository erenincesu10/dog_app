import 'package:dog_app/app/core/constants/color_constant.dart';
import 'package:dog_app/app/core/extensions/build_context_extensions.dart';
import 'package:dog_app/app/presentation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenerateButton extends StatefulWidget {
  const GenerateButton({super.key});

  @override
  State<GenerateButton> createState() => _GenerateButtonState();
}

class _GenerateButtonState extends State<GenerateButton> {
  @override
  Widget build(BuildContext context) {
    var bloc = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorConstant.cButtonBackground,
            fixedSize: Size(context.width * 0.7, context.height * 0.07),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () async {
            bloc.add(FetchRandomImageEvent(
              name: state.breedModels[state.selectedIndex].name!,
            ));
            await Future.delayed(const Duration(milliseconds: 300))
                .whenComplete(() {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          return AlertDialog(
                            surfaceTintColor: Colors.transparent,
                            backgroundColor: Colors.transparent,
                            content: SizedBox(
                              width: context.width * 0.8,
                              height: context.height * 0.6,
                              child: Column(
                                children: [
                                  Container(
                                    width: context.width * 0.8,
                                    height: context.width * 0.8,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(state.fetchedImage),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.primaryColor,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Center(
                                      child: IconButton(
                                          splashColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          iconSize: 18,
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(Icons.close)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ));
            });
          },
          child: const Text(
            "Generate",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
