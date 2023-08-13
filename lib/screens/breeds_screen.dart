import 'package:flutter/material.dart';
import 'package:flutter_dogs/db/dogs_db.dart';
import 'package:flutter_dogs/networking/dogs_api.dart';

import 'package:flutter_dogs/widgets/gridWidget.dart';
import 'package:provider/provider.dart';

import '../view_model/dogs_breed_notifier.dart';

class BreedsScreen extends StatelessWidget {
  const BreedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DogsBreedNotifier>(
      create: (context) => DogsBreedNotifier(DogsApi(), DogsDb()),
      child: const DogBreedsView(),
    );
  }
}

class DogBreedsView extends StatelessWidget {
  const DogBreedsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            body: Consumer<DogsBreedNotifier>(builder: (context, value, child) {
          return value.dogBreeds.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : GridTextWidget(listOfBreeds: value.dogBreeds);
        })),
      ),
    );
  }
}
