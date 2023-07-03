import 'package:flutter/material.dart';
//ToDO: Data Transfer Object DTO or Model
class Dog {
  Dog({
    required this.breed,
    this.subBreed,
  });

  final String breed;
  final String? subBreed;

  String get fullBreed => '${(subBreed) ?? ''} $breed'.trim();

  String get imageUrlPath => subBreed == null ? breed : '$breed/$subBreed';

// factory Dog.fromJson(Map json) {
//   return Dog(
//     breed: json["message"],
//   );
// }
}

// class DogImages {
//   final String image;
//
//   DogImages({required this.image});
//
//   factory DogImages.fromJson(List<String> json) {
//     return DogImages(
//       image: ["message"] as String,
//     );
//   }
// }
