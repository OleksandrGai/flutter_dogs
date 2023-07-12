import 'package:flutter/material.dart';
import 'package:flutter_dogs/Model/dogs.dart';

import '../screens/info_about_dog_screen.dart';

class GridTextWidget extends StatelessWidget {
  GridTextWidget({super.key, required this.listOfBreeds});

  List<Dog> listOfBreeds;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: listOfBreeds.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 1),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return DogImages(
                    breed: listOfBreeds[index],
                  );
                }),
              );
            },
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: Text(
                        listOfBreeds[index].firstLetterCapitalized(),
                        //breedToCapitalize(listOfBreeds[index].fullBreed),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

extension FirstLetterCapitalized on Dog {
  String firstLetterCapitalized() {
    return '${fullBreed[0].toUpperCase()}${fullBreed.substring(1)}';
  }
}
