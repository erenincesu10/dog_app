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
  final String fetchedImage;
  const HomeState({
    required this.status,
    required this.breedModels,
    required this.selectedIndex,
    required this.fetchedImage,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<DogBreedModel>? breedModels,
    int? selectedIndex,
    String? fetchedImage,
  }) {
    return HomeState(
      status: status ?? this.status,
      breedModels: breedModels ?? this.breedModels,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      fetchedImage: fetchedImage ?? this.fetchedImage,
    );
  }

  @override
  List<Object> get props => [
        status,
        breedModels,
        selectedIndex,
        fetchedImage,
      ];
}
