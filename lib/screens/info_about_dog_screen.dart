import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dogs/blocs/dog_images_bloc_directory/dog_images_bloc.dart';

import '../model/dogs.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class DogImages extends StatelessWidget {
  const DogImages({
    super.key,
    required this.breed,
    this.count = 10,
  });

  final Dog breed;
  final int count;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DogImagesBloc(breed, count),
      child: const DogImagesView(),
    );
  }
}

class DogImagesView extends StatelessWidget {
  const DogImagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<DogImagesBloc, DogImagesState>(
            builder: (context, state) {
          if (state is LoadedData) {
            return ListView.builder(
                itemCount: state.dogImagesList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                        height: 250,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                state.dogImagesList[index],
                                fit: BoxFit.fitWidth,
                              )),
                        )),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
        // body: Consumer<DogImagesNotifier>(builder: (context, value, child) {
        //   return value.dogImagesList.isEmpty
        //       ? const Center(
        //           child: CircularProgressIndicator(),
        //         )
        //       : ListView.builder(
        //           itemCount: value.dogImagesList.length,
        //           itemBuilder: (context, index) {
        //             return Padding(
        //               padding: const EdgeInsets.all(4.0),
        //               child: Container(
        //                   height: 250,
        //                   width: 150,
        //                   decoration: BoxDecoration(
        //                     color: Colors.grey.shade300,
        //                     borderRadius: BorderRadius.circular(10),
        //                   ),
        //                   child: Padding(
        //                     padding: const EdgeInsets.all(3),
        //                     child: ClipRRect(
        //                         borderRadius: BorderRadius.circular(10),
        //                         child: Image.network(
        //                           value.dogImagesList[index],
        //                           fit: BoxFit.fitWidth,
        //                         )),
        //                   )),
        //             );
        //           });
        // }),
      ),
    );
  }
}
