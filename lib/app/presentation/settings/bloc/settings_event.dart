part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SetVersionEvent extends SettingsEvent {
  final String versionNumber;
  const SetVersionEvent({required this.versionNumber});

  @override
  List<Object> get props => [
        versionNumber,
      ];
}
