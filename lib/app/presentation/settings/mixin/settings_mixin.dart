import 'package:dog_app/app/data/models/settings_tile_model.dart';
import 'package:dog_app/app/presentation/settings/settings_view.dart';
import 'package:flutter/material.dart';

mixin SettingsMixin on State<SettingsView> {
  List<SettingsTileModel> settingsListTiles = [
    SettingsTileModel(
      iconPath: "assets/icons/img_help.png",
      title: "Help",
    ),
    SettingsTileModel(
      iconPath: "assets/icons/img_star.png",
      title: "Rate Us",
    ),
    SettingsTileModel(
      iconPath: "assets/icons/img_share.png",
      title: "Share with Friends",
    ),
    SettingsTileModel(
      iconPath: "assets/icons/img_terms.png",
      title: "Terms of Use",
    ),
    SettingsTileModel(
      iconPath: "assets/icons/img_privacy.png",
      title: "Privacy Policy",
    ),
    SettingsTileModel(
      iconPath: "assets/icons/img_os.png",
      title: "OS Version",
    ),
  ];
}
