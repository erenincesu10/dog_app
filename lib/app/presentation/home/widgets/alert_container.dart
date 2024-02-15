import 'package:dog_app/app/core/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class AlertContainer extends StatefulWidget {
  const AlertContainer({super.key});

  @override
  State<AlertContainer> createState() => _AlertContainerState();
}

class _AlertContainerState extends State<AlertContainer> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: context.width * 0.8,
        height: context.height * 0.8,
        child: Column(
          children: [
            Container(
              width: context.width * 0.8,
              height: context.height * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                color: Colors.red,
              ),
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
