import 'package:flutter/material.dart';

import '../model/dogs.dart';
import '../networking/dogs_api.dart';

class DogImagesNotifier extends ChangeNotifier {
  final List<String> dogImagesList = [];
  final Dog breed;
  final int count;
  final DogsApi _api;

  DogImagesNotifier(this._api, this.breed, this.count) {
    _api.dogImages(breed, count).then((value) {
      dogImagesList.addAll(value);
      notifyListeners();
    });
  }
}
