import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc()
      : super(
          const SettingsState(
            versionNumber: "",
          ),
        ) {
    on<SetVersionEvent>(_setVersion);
  }

  static const MethodChannel _channel = MethodChannel('platform_channel');

  Future<void> _setVersion(
      SetVersionEvent event, Emitter<SettingsState> emit) async {
    String osVersion;
    try {
      osVersion = await _channel.invokeMethod('getOSVersion');
      emit(state.copyWith(versionNumber: osVersion));
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      osVersion = "Failed";
      emit(state.copyWith(versionNumber: osVersion));
    }
  }
}
