import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dogs/dogs.dart';
import 'package:flutter_dogs/widgets/gridWidget.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    const MainWidget(),
  );
}


//ToDo: move it to separate file and rename it
class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

var listImage = <String>[];

class _MainWidgetState extends State<MainWidget> {

  Future<List<Dog>> getData() async {
    final dogs = <Dog>[];
    String link = "https://dog.ceo/api/breeds/list/all";
    final res = await http.get(Uri.parse(link));
    // print(res.body);
    final data = json.decode(res.body) as Map<String, dynamic>;
    //print(data);
    final rest = data["message"] as Map<String, dynamic>;
    // print(rest);
    rest.forEach((k, v) {
      final list = v as List;
      if (list.isEmpty) {
        dogs.add(
          Dog(breed: k),
        );
      } else {
        for (var i = 0; i < list.length; i++) {
          dogs.add(Dog(breed: k, subBreed: list[i]));
        }
      }
    });
     print(dogs);
    return dogs;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                return snapshot.data != null
                    ? gridWidget(snapshot.data!)
                    : const Center(child: CircularProgressIndicator());
              }),
        ),
      ),
    );
  }
}
