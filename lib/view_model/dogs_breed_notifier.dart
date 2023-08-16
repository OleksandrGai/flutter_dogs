import 'package:flutter/material.dart';
import 'package:flutter_dogs/dog_db/dog_database.dart';

import '../model/dogs.dart';
import '../networking/breeds_type_data.dart';

class DogsBreedNotifier extends ChangeNotifier {
  final List<Dog> dogBreeds = [];

  DogsBreedNotifier() {
    putDogsInDB();
    DBProvider.db.getAllDogs().then((value) {
      dogBreeds.addAll(value);
    });
    notifyListeners();
  }
}
