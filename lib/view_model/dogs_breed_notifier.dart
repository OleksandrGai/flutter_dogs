import 'package:flutter/material.dart';
import 'package:flutter_dogs/dog_db/dog_database.dart';

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

/*
class DogsBreedNotifier extends ChangeNotifier {
   List<Dog> dogBreeds = [];
  DogRepository _dogRepository = DogRepository();

  DogsBreedNotifier() {
    // breedsTypeData().then((value) {
    //   dogBreeds.addAll(value);
    //   notifyListeners();
    // });
    getDogs();
  }
  void getDogs(){
    print("getdogs inside provider");
    _dogRepository.breedsTypeData().then((value) {
      dogBreeds = value;
      notifyListeners();
    });
  }
}

 */
