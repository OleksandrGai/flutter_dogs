import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/dogs.dart';

Future<List<Dog>> breedsTypeData() async {
  final dogs = <Dog>[];
  String link = "https://dog.ceo/api/breeds/list/all";
  final response = await http.get(Uri.parse(link));
  final data = json.decode(response.body) as Map<String, dynamic>;
  final result = data["message"] as Map<String, dynamic>;
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
}
