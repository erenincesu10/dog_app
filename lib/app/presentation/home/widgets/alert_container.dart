import 'package:dog_app/app/core/constants/color_constant.dart';
import 'package:dog_app/app/core/extensions/build_context_extensions.dart';
import 'package:dog_app/app/presentation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlertContainer extends StatefulWidget {
  const AlertContainer({
    super.key,
  });

  @override
  State<AlertContainer> createState() => _AlertContainerState();
}

class _AlertContainerState extends State<AlertContainer> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            width: context.width * 0.95,
            height: context.height * 0.85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: context.width * 0.9,
                  height: context.height * 0.4,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          state.breedModels[state.selectedIndex].imagePath!,
                        ),
                        fit: BoxFit.cover),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    color: Colors.white,
                  ),
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    maxRadius: 20,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Breed",
                  style:
                      TextStyle(color: ColorConstant.cTextBlue, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  state.breedModels[state.selectedIndex].name!,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Sub Breed",
                  style:
                      TextStyle(color: ColorConstant.cTextBlue, fontSize: 20),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    state.breedModels[state.selectedIndex].subBreeds!.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        state
                            .breedModels[state.selectedIndex].subBreeds![index],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstant.cButtonBackground,
                    fixedSize: Size(context.width * 0.7, context.height * 0.07),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    print("yes");
                  },
                  child: const Text(
                    "Generate",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
