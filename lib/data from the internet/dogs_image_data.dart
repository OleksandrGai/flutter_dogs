import 'dart:async';
import 'dart:convert';
import 'package:flutter_dogs/Model/dogs.dart';
import 'package:http/http.dart' as http;

Future<List<String>> dogImages(Dog breed, int count) async {
  final String link =
      "https://dog.ceo/api/breed/${breed.imageUrlPath}/images/random/$count";
  final request = await http.get(Uri.parse(link));
  final data = jsonDecode(request.body);
  print((data["message"] as List).map((element) => element as String).toList());
  return (data["message"] as List).map((element) => element as String).toList();
}
