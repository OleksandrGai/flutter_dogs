import 'dart:convert';
import '../model/dogs.dart';
import 'package:http/http.dart' as http;

abstract class DogsApi {
  factory DogsApi() => _DogsApiImpl();

  Future<List<Dog>> breedsTypeData();

  Future<List<String>> dogImages(Dog breed, int count);
}

class _DogsApiImpl implements DogsApi {
  static const _baseUrl = 'https://dog.ceo';
  static const _typesPath = '/api/breeds/list/all';

  String _imagePath(Dog breed, int count) =>
      '/api/breed/${breed.imageUrlPath}/images/random/$count';

  Future<T> _getRequest<T>(
    Uri uri,
    T Function(Map<dynamic, dynamic>) parser,
  ) async {
    final response = await http.get(uri);
    final jsonResp = json.decode(response.body);
    return parser(jsonResp);
  }

  @override
  Future<List<Dog>> breedsTypeData() async {
    return _getRequest(
      Uri.parse('$_baseUrl$_typesPath'),
      (json) {
        final dogs = <Dog>[];
        final result = json["message"] as Map<String, dynamic>;
        result.forEach((k, v) {
          final list = v as List;
          if (list.isEmpty) {
            dogs.add(
              Dog(breed: k),
            );
          } else {
            for (var i = 0; i < list.length; i++) {
              dogs.add(Dog(breed: k, subBreed: list[i]));
            }
          }
        });
        return dogs;
      },
    );
  }

  @override
  Future<List<String>> dogImages(Dog breed, int count) async {
    return _getRequest(
        Uri.parse('$_baseUrl${_imagePath(breed, count)}'),
        (json) => (json["message"] as List)
            .map((element) => element as String)
            .toList());
  }
}

