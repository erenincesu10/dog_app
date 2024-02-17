import 'package:dog_app/app/data/models/dog_model.dart';

abstract class DogRemoteDataSource {
  Future<List<DogBreedModel>> fetchBreeds();
    Future<String>fetchBreedByName({
    required String name,
  });
}
