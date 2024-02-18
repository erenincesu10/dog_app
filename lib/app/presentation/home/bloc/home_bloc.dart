import 'package:bloc/bloc.dart';
import 'package:dog_app/app/core/result/result.dart';
import 'package:dog_app/app/data/models/dog_model.dart';
import 'package:dog_app/app/domain/repository/dog_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required DogRepository dogRepository})
      : _dogRepository = dogRepository,
        super(
          const HomeState(
              status: HomeStatus.init,
              breedModels: [],
              selectedIndex: 0,
              fetchedImage: "",
              textfieldStatus: 0,
              searchList: []),
        ) {
    on<FetchBreedsEvent>(_fetchBreeds);
    on<SetSelectedIndexEvent>(_setSelectedIndex);
    on<FetchRandomImageEvent>(_fetchBreedByName);
    on<ChangeTextFieldStatusEvent>(_setTextfieldStatus);
    on<SearchDogByNameEvent>(_searchBreedByName);
  }

  TextEditingController searchController = TextEditingController();

  final DogRepository _dogRepository;

  Future<void> _fetchBreeds(
      FetchBreedsEvent event, Emitter<HomeState> emit) async {
    emit(
      state.copyWith(status: HomeStatus.loading),
    );
    DataResult result = await _dogRepository.fetchBreeds();
    if (result.success) {
      emit(
        state.copyWith(status: HomeStatus.success, breedModels: result.data),
      );
    } else {
      emit(
        state.copyWith(status: HomeStatus.error),
      );
    }
  }

  void _setSelectedIndex(SetSelectedIndexEvent event, Emitter<HomeState> emit) {
    emit(
      state.copyWith(
        selectedIndex: event.selectedIndex,
      ),
    );
  }

  Future<void> _fetchBreedByName(
      FetchRandomImageEvent event, Emitter<HomeState> emit) async {
    var result = await _dogRepository.fetchBreedByName(name: event.name);
    emit(
      state.copyWith(fetchedImage: result.data),
    );
  }

  void _setTextfieldStatus(
      ChangeTextFieldStatusEvent event, Emitter<HomeState> emit) {
    emit(
      state.copyWith(textfieldStatus: event.textfieldStatus),
    );
  }

  void _searchBreedByName(SearchDogByNameEvent event, Emitter<HomeState> emit) {
    var text = searchController.text.trim();
    List<DogBreedModel> newList = [];
    for (var dog in state.breedModels) {
      if (dog.name!.toLowerCase().contains(text.toLowerCase())) {
        newList.add(dog);
      }
    }
    emit(
      state.copyWith(searchList: newList),
    );
  }
}
