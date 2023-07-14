import 'package:flutter/material.dart';

import '../model/dogs.dart';
import '../networking/breeds_type_data.dart';

class DogsBreedNotifier extends ChangeNotifier {
  final List<Dog> dogBreeds = [];

  DogsBreedNotifier() {
    breedsTypeData().then((value) {
      dogBreeds.addAll(value);
      notifyListeners();
    });
  }
}
