import 'package:flutter/material.dart';

import '../model/dogs.dart';
import '../networking/dogs_image_data.dart';

class DogImagesNotifier extends ChangeNotifier {
  final List<String> dogImagesList = [];
  final Dog breed;
  final int count;

  DogImagesNotifier(this.breed, this.count) {
    dogImages(breed, count).then((value) {
      dogImagesList.addAll(value);
      notifyListeners();
    });
  }
}
