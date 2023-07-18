part of 'dog_breeds_bloc.dart';

class DogBreedsState {}

class DogBreedsInitial extends DogBreedsState {}

class DogBreedsLoaded extends DogBreedsState {
  DogBreedsLoaded(this.dogBreedsList);

  final List<Dog> dogBreedsList;
}
