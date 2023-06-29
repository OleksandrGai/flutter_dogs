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
    return data["message"].map((element) => element as String).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: _dogImages(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Image.network(snapshot.data![index]);
                    })
                : const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
