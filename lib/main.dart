import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dogs/widgets/gridWidget.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    MainWinget(),
  );
}

class MainWinget extends StatefulWidget {
  MainWinget({super.key});

  @override
  State<MainWinget> createState() => _MainWingetState();
}

var list = <String>[];
var listImage = <String>[];

class _MainWingetState extends State<MainWinget> {
  Future getData() async {
    String link = "https://dog.ceo/api/breeds/list/all";
    var res = await http.get(Uri.parse(link));
    // print(res.body);

    var data = json.decode(res.body);
    //print(data);
    var rest = data["message"];
    // print(rest);
    rest.forEach((k, v) {
      if (v.isEmpty) {
        list.add(k);
      } else {
        for (var i = 0; i < v.length; i++) {
          list.add(k + " " + v[i]);
        }
      }
    });
    // print(list);
    return list;
  }

  Future getImageData() async {
    String link = "https://dog.ceo/api/breed/hound/images";
    var res = await http.get(Uri.parse(link));
    // print(res.body);
    var data = json.decode(res.body);
    //print(data);
    var rest = (data["message"] as List).map((item) => item as String).toList();
    ;
    // print(rest.runtimeType);
    listImage.addAll(rest);
    print(listImage);
    return listImage;
  }

  @override
  void initState() {
    super.initState();
    getData();
    getImageData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: FutureBuilder(
              future: Future.wait([getImageData(), getData()]),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                return snapshot.data != null
                    ? GridWidget(snapshot.data![0], snapshot.data![1])
                    : Center(child: CircularProgressIndicator());
              }),
        ),
      ),
    );
  }
}
