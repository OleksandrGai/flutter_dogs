import 'package:flutter/material.dart';

class BreedDogs {
  String breed;

  BreedDogs({
    required this.breed,
  });

  factory BreedDogs.fromJson(Map json) {
    return BreedDogs(
      breed: json["message"],
    );
  }
}

class DogImages {
  final String image;

  DogImages({required this.image});

  factory DogImages.fromJson(List<String> json) {
    return DogImages(
      image: ["message"] as String,
    );
  }
}
