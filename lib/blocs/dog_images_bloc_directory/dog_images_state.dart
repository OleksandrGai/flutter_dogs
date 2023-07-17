part of 'dog_images_bloc.dart';

class DogImagesState {}

class DogImagesInitial extends DogImagesState {}

class LoadedData extends DogImagesState {
  final List<String> dogImagesList;

  LoadedData({required this.dogImagesList});
}
