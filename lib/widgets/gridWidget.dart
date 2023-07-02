import 'package:flutter/material.dart';
import 'package:flutter_dogs/dogs.dart';

import 'details_sreen.dart';


//TODO: convert function to class
Widget gridWidget(
  List<Dog> listOfText,
) {
  return GridView.builder(
      itemCount: listOfText.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 1),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return DogImages(
                  breed: listOfText[index],
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
                      listOfText[index].fullBreed,
                      //listOfText[index]
                      //.replaceAll(RegExp('/'), ' ').toUpperCase(),
                      // style: const TextStyle(
                      //     fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      });
}
