import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/dogs.dart';

Future<List<String>> dogImages(Dog breed, int count) async {
  final String link =
      "https://dog.ceo/api/breed/${breed.imageUrlPath}/images/random/$count";
  final request = await http.get(Uri.parse(link));
  final data = jsonDecode(request.body);
  return (data["message"] as List).map((element) => element as String).toList();
}
