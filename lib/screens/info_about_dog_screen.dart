import 'package:flutter/material.dart';

import '../data from the internet/dogs_image_data.dart';
import '../Model/dogs.dart';

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
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: dogImages(breed, 10),
          builder: (context, snapshot) {
            return snapshot.data != null
                ? ListView.builder(
                    itemCount: snapshot.data!.length,
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
                                    snapshot.data![index],
                                    fit: BoxFit.fitWidth,
                                  )),
                            )),
                      );
                    })
                : const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
