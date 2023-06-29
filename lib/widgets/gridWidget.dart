import 'package:flutter/material.dart';

import 'details_sreen.dart';

Widget GridWidget(
  List<String> listOfImages,
  List<String> listOfText,
) {
  return GridView.builder(
      itemCount: listOfImages.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
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
                height: 190,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(listOfImages[index]),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.lightBlue,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                listOfText[index],
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      });
}
