import 'package:dog_app/app/presentation/settings/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsListTileWidget extends StatefulWidget {
  final String iconPath;
  final String title;
  final bool isVersion;
  String? versionNumber;
  SettingsListTileWidget(
      {super.key,
      required this.iconPath,
      required this.title,
      required this.isVersion,
      this.versionNumber});

  @override
  State<SettingsListTileWidget> createState() => _SettingsListTileWidgetState();
}

class _SettingsListTileWidgetState extends State<SettingsListTileWidget> {
  @override
  Widget build(BuildContext context) {
    var bloc = context.read<SettingsBloc>();
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return ListTile(
          onTap: () async {
            bloc.add(SetVersionEvent(versionNumber: "versionNumber"));
          },
          leading: Image.asset(widget.iconPath),
          title: Text(widget.title),
          trailing: widget.isVersion
              ? Text(widget.versionNumber!)
              : Image.asset('assets/icons/img_arrow.png'),
        );
      },
    );
  }
}
