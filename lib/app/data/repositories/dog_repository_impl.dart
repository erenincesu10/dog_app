import 'package:dog_app/app/core/result/result.dart';
import 'package:dog_app/app/data/models/dog_model.dart';
import 'package:dog_app/app/domain/datasource/remote/dog_remote_datasource.dart';
import 'package:dog_app/app/domain/repository/dog_repository.dart';

class DogRepositroyImpl implements DogRepository {
  final DogRemoteDataSource _remoteDataSource;

  DogRepositroyImpl({required DogRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;
  @override
  Future<DataResult<List<DogBreedModel>>> fetchBreeds() async {
    try {
      var list = await _remoteDataSource.fetchBreeds();
      return SuccessDataResult(data: list);
    } catch (e) {
      return ErrorDataResult(message: "DogRepositoryImpl fetchBreeds $e");
    }
  }
}
