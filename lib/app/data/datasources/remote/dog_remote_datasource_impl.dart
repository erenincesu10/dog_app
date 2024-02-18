import 'dart:convert';
import 'dart:io';

import 'package:dog_app/app/data/models/dog_model.dart';
import 'package:dog_app/app/domain/datasource/remote/dog_remote_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class DogRemoteDataSourceImpl implements DogRemoteDataSource {
  @override
  Future<List<DogBreedModel>> fetchBreeds() async {
    var response =
        await http.get(Uri.parse("https://dog.ceo/api/breeds/list/all"));
    var breedsData = jsonDecode(response.body);
    var breeds = breedsData["message"] as Map<String, dynamic>;

    List<DogBreedModel> breedModels = [];
    for (var breed in breeds.keys) {
      File file = File("");
      print("hello");
      List<String> subBreeds = List<String>.from(breeds[breed]);
      String imageUrl = '';

      var imageUrlResponse = await http.get(
        Uri.parse("https://dog.ceo/api/breed/$breed/images/random"),
      );

      if (imageUrlResponse.statusCode == 200) {
        var imageUrlData = jsonDecode(imageUrlResponse.body);

        imageUrl = imageUrlData["message"];
        Future<File> getLocalImageFile() async {
          Directory directory = await getApplicationDocumentsDirectory();
          String filePath = '${directory.path}/cached_image_$breed.jpg';
          file = File(filePath);

          if (await file.exists()) {
            return file;
          } else {
            final response = await http.get(Uri.parse(imageUrl));
            if (response.statusCode == 200) {
              await file.writeAsBytes(response.bodyBytes);
              return file;
            } else {
              throw Exception('Resim indirilemedi');
            }
          }
        }

        file = await getLocalImageFile();
      }

      if (imageUrl.isNotEmpty) {
        breedModels.add(
            DogBreedModel(name: breed, imagePath: file, subBreeds: subBreeds));
      }
    }
    return breedModels;
  }

  @override
  Future<String> fetchBreedByName({required String name}) async {
    http.Response response = await http
        .get(Uri.parse("https://dog.ceo/api/breed/$name/images/random"));
    var link = jsonDecode(response.body);
    return link["message"];
  }
}
