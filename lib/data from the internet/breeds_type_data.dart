import 'dart:async';
import 'dart:convert';
import 'package:flutter_dogs/dogs.dart';
import 'package:http/http.dart' as http;

Future<List<Dog>> getData() async {
  final dogs = <Dog>[];
  String link = "https://dog.ceo/api/breeds/list/all";
  final response = await http.get(Uri.parse(link));
  // print(res.body);
  final data = json.decode(response.body) as Map<String, dynamic>;
  //print(data);
  final result = data["message"] as Map<String, dynamic>;
  //print(result);
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
  // print(dogs);
  return dogs;
}
