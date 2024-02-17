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
  const HomeState({
    required this.status,
    required this.breedModels,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<DogBreedModel>? breedModels,
  }) {
    return HomeState(
      status: status ?? this.status,
      breedModels: breedModels ?? this.breedModels,
    );
  }

  @override
  List<Object> get props => [
        status,
        breedModels,
      ];
}
