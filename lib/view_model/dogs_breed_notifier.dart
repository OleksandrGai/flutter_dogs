import 'package:flutter/material.dart';

import '../db/dogs_db.dart';
import '../model/dogs.dart';
import '../networking/dogs_api.dart';

class DogsBreedNotifier extends ChangeNotifier {
  final List<Dog> dogBreeds = [];
  final DogsApi _api;
  final DogsDb _db;

  DogsBreedNotifier(this._api, this._db) {
    _api.breedsTypeData().then((value) {
      return _db.insertAll(value).then((_) {
        _db.dogs().then((dogs) {
          dogBreeds.addAll(dogs);
          notifyListeners();
        });
      });
    });
  }
}
