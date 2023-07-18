import 'dart:core';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/dogs.dart';
import '../../networking/breeds_type_data.dart';

part 'dog_breeds_event.dart';

part 'dog_breeds_state.dart';

class DogBreedsBloc extends Bloc<DogBreedsEvent, DogBreedsState> {
  DogBreedsBloc() : super(DogBreedsInitial()) {
    on<FetchedDogBreeds>((event, emit) async {
      final List<Dog> dogBreeds = await breedsTypeData();
      // print(dogBreeds);
      emit(DogBreedsLoaded(dogBreeds));
    });
    add(FetchedDogBreeds());
  }
}
