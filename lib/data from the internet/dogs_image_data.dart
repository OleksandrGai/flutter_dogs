// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter_dogs/dogs.dart';
// import 'package:http/http.dart' as http;
//
// Future<List<String>> dogImages() async {
//
//
//   final int count = 10;
//   final String link = "https://dog.ceo/api/breed/${Dog(breed: )}/images/random/$count";
//   final request = await http.get(Uri.parse(link));
//   final data = jsonDecode(request.body);
//   return (data["message"] as List)
//       .map((element) => element as String)
//       .toList();
// }