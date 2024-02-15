import 'package:dog_app/app/core/extensions/build_context_extensions.dart';
import 'package:dog_app/app/presentation/home/widgets/alert_container.dart';
import 'package:flutter/material.dart';

class GridContainer extends StatelessWidget {
  const GridContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (context) => AlertContainer());
      },
      child: Container(
        width: context.width * 0.3,
        height: context.width * 0.3,
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          width: context.width * 0.2,
          height: context.height * 0.05,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.24),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
          ),
          child: Center(child: Text("Breed")),
        ),
      ),
    );
  }
}
