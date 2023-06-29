import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DogImages extends StatelessWidget {
  const DogImages({super.key, required this.breed, this.count = 10});

  final String breed;
  final int count;

  Future<List<String>> _dogImages() async {
    final String link = "https://dog.ceo/api/breed/$breed/images/random/$count";
    final request = await http.get(Uri.parse(link));
    final data = jsonDecode(request.body);
    return (data["message"] as List)
        .map((element) => element as String)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: _dogImages(),
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
                                  child: Image.network(snapshot.data![index], fit: BoxFit.fitWidth,)),
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
