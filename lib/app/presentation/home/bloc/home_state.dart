// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

enum HomeStatus {
  init,
  loading,
  success,
  error,
}

class HomeState extends Equatable {
  final HomeStatus status;
  final List<DogBreedModel> breedModels;
  final int selectedIndex;
  const HomeState({
    required this.status,
    required this.breedModels,
    required this.selectedIndex,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<DogBreedModel>? breedModels,
    int? selectedIndex,
  }) {
    return HomeState(
      status: status ?? this.status,
      breedModels: breedModels ?? this.breedModels,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<Object> get props => [
        status,
        breedModels,
        selectedIndex,
      ];
}
