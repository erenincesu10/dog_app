import 'package:dog_app/app/core/extensions/build_context_extensions.dart';
import 'package:dog_app/app/core/get_it/get_it.dart';
import 'package:dog_app/app/presentation/settings/bloc/settings_bloc.dart';
import 'package:dog_app/app/presentation/settings/mixin/settings_mixin.dart';
import 'package:dog_app/app/presentation/settings/widgets/settings_listtile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> with SettingsMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      bloc: context.read<SettingsBloc>(),
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SizedBox(
              width: context.width,
              height: context.height,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const Divider(
                  indent: 16,
                ),
                shrinkWrap: true,
                itemCount: settingsListTiles.length,
                itemBuilder: (context, index) => SettingsListTileWidget(
                  iconPath: settingsListTiles[index].iconPath!,
                  title: settingsListTiles[index].title!,
                  isVersion:
                      index == settingsListTiles.length - 1 ? true : false,
                  versionNumber: index == settingsListTiles.length - 1
                      ? state.versionNumber
                      : null,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
