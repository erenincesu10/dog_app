import 'dart:convert';

import 'package:dog_app/app/data/models/dog_model.dart';
import 'package:dog_app/app/domain/datasource/remote/dog_remote_datasource.dart';
import 'package:http/http.dart' as http;

class DogRemoteDataSourceImpl implements DogRemoteDataSource {
  @override
  Future<List<DogBreedModel>> fetchBreeds() async {
    var breedsResponse =
        await http.get(Uri.parse("https://dog.ceo/api/breeds/list/all"));
    var breedsData = jsonDecode(breedsResponse.body);
    var breeds = breedsData["message"] as Map<String, dynamic>;

    List<DogBreedModel> breedModels = [];
    for (var breed in breeds.keys) {
      print("hello");
      List<String> subBreeds = List<String>.from(breeds[breed]);
      String imageUrl = '';

      var imageUrlResponse = await http
          .get(Uri.parse("https://dog.ceo/api/breed/$breed/images/random"));

      if (imageUrlResponse.statusCode == 200) {
        var imageUrlData = jsonDecode(imageUrlResponse.body);

        imageUrl = imageUrlData["message"];
      } else {}

      /// If the imageUrl is not empty, add it to the list
      if (imageUrl.isNotEmpty) {
        breedModels.add(DogBreedModel(
            name: breed, imagePath: imageUrl, subBreeds: subBreeds));
      }
    }
    return breedModels;
  }
}