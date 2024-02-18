// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class FetchRandomImageEvent extends HomeEvent {
  final String name;
  const FetchRandomImageEvent({
    required this.name,
  });
  @override
  List<Object> get props => [
        name,
      ];
}

class ChangeTextFieldStatusEvent extends HomeEvent {
  final int textfieldStatus;
  const ChangeTextFieldStatusEvent({
    required this.textfieldStatus,
  });
  @override
  List<Object> get props => [
        textfieldStatus,
      ];
}

class SearchDogByNameEvent extends HomeEvent {
  const SearchDogByNameEvent();
  @override
  List<Object> get props => [];
}
