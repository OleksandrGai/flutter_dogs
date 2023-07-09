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
}
