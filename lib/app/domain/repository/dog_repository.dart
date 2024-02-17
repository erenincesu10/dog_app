import 'package:dog_app/app/core/result/result.dart';
import 'package:dog_app/app/data/models/dog_model.dart';

///Daha sonrası için api değiştinde abstract classtan yeni bir implementasyon oluşturmamızı sağlar.
abstract class DogRepository {
  Future<DataResult<List<DogBreedModel>>> fetchBreeds();
  Future<DataResult<String>> fetchBreedByName({
    required String name,
  });
}
