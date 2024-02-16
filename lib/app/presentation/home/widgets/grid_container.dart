// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:dog_app/app/core/extensions/build_context_extensions.dart';
import 'package:dog_app/app/presentation/home/widgets/alert_container.dart';

class GridContainer extends StatelessWidget {
  final String imageUrl;
  final String name;
  const GridContainer({
    Key? key,
    required this.imageUrl,
    required this.name,
  }) : super(key: key);

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
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
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
          child: Center(child: Text(name)),
        ),
      ),
    );
  }
}
