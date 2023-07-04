import 'package:flutter/material.dart';
import 'package:flutter_dogs/dogs.dart';

import '../screens/info_about_dog_screen.dart';

//TODO: convert function to class
class GridTextWidget extends StatelessWidget {
  GridTextWidget({super.key, required this.listOfBreeds});

  List<Dog> listOfBreeds;

  String breedToCapitalize(String dogBreeds) {
    String firstLetter = dogBreeds[0].toUpperCase();
    for (var letter = 1; letter < dogBreeds.length - 1; letter++) {
      if (dogBreeds[letter - 1] == " ") {
        firstLetter = firstLetter + dogBreeds[letter + 1].toUpperCase();
      } else {
        firstLetter = firstLetter + dogBreeds[letter];
      }
    }
    return firstLetter;
  }

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
                        breedToCapitalize(listOfBreeds[index].fullBreed),
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
