part of 'main_bloc.dart';

sealed class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class SelectIndexEvent extends MainEvent {
  final int selectedIndex;
  const SelectIndexEvent({
    required this.selectedIndex,
  });

  @override
  List<Object> get props => [
        selectedIndex,
      ];
}
