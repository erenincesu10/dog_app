// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final String versionNumber;
  const SettingsState({
    required this.versionNumber,
  });

  SettingsState copyWith({
    String? versionNumber,
  }) {
    return SettingsState(
      versionNumber: versionNumber ?? this.versionNumber,
    );
  }

  @override
  List<Object> get props => [
        versionNumber,
      ];
}
