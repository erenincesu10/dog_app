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
  final int textfieldStatus;
  final List<DogBreedModel> searchList;
  const HomeState({
    required this.status,
    required this.breedModels,
    required this.selectedIndex,
    required this.fetchedImage,
    required this.textfieldStatus,
    required this.searchList,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<DogBreedModel>? breedModels,
    int? selectedIndex,
    String? fetchedImage,
    int? textfieldStatus,
    List<DogBreedModel>? searchList,
  }) {
    return HomeState(
      status: status ?? this.status,
      breedModels: breedModels ?? this.breedModels,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      fetchedImage: fetchedImage ?? this.fetchedImage,
      textfieldStatus: textfieldStatus ?? this.textfieldStatus,
      searchList: searchList ?? this.searchList,
    );
  }

  @override
  List<Object> get props => [
        status,
        breedModels,
        selectedIndex,
        fetchedImage,
        textfieldStatus,
        searchList,
      ];
}
