import 'package:bloc/bloc.dart';
import 'package:dog_app/app/core/result/result.dart';
import 'package:dog_app/app/data/models/dog_model.dart';
import 'package:dog_app/app/domain/repository/dog_repository.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required DogRepository dogRepository})
      : _dogRepository = dogRepository,
        super(const HomeState(
          status: HomeStatus.init,
          breedModels: [],
          selectedIndex: 0,
          fetchedImage: "",
        )) {
    on<FetchBreedsEvent>(_fetchBreeds);
    on<SetSelectedIndexEvent>(_setSelectedIndex);
    on<FetchRandomImageEvent>(_fetchBreedByName);
  }

  final DogRepository _dogRepository;

  Future<void> _fetchBreeds(
      FetchBreedsEvent event, Emitter<HomeState> emit) async {
    emit(
      state.copyWith(status: HomeStatus.loading),
    );
    DataResult result = await _dogRepository.fetchBreeds();
    if (result.success) {
      print("buradayım");

      emit(
        state.copyWith(status: HomeStatus.success, breedModels: result.data),
      );
    } else {
      print(result.message);
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
}
