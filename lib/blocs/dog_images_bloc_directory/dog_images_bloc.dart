import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/dogs.dart';
import '../../networking/dogs_image_data.dart';

part 'dog_images_event.dart';

part 'dog_images_state.dart';

class DogImagesBloc extends Bloc<DogImagesEvent, DogImagesState> {
  final Dog breed;
  final int count;

  DogImagesBloc(this.breed, this.count) : super(DogImagesInitial()) {
    on<FetchedDogImages>((event, emit) async {
      final List<String> dogsImages = await dogImages(breed, count);
      print(dogsImages);
      emit(LoadedData(dogImagesList: dogsImages));
    });
    add(FetchedDogImages());
  }
}
