part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class FetchBreedsEvent extends HomeEvent {
  const FetchBreedsEvent();

  @override
  List<Object> get props => [];
}

class SetSelectedIndexEvent extends HomeEvent {
  final int selectedIndex;
  const SetSelectedIndexEvent({
    required this.selectedIndex,
  });

  @override
  List<Object> get props => [
        selectedIndex,
      ];
}
