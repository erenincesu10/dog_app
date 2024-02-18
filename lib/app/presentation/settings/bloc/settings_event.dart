part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SetVersionEvent extends SettingsEvent {
  const SetVersionEvent();

  @override
  List<Object> get props => [];
}
