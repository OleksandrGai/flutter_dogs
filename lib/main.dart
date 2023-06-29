import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dogs/widgets/gridWidget.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    const MainWidget(),
  );
}

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

var list = <String>[];
var listImage = <String>[];

class _MainWidgetState extends State<MainWidget> {
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
          list.add(k + "/" + v[i]);
        }
      }
    });
    // print(list);
    return list;
  }


  @override
  void initState() {
    super.initState();
    getData();
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
                    ? GridWidget(snapshot.data!)
                    : const Center(child: CircularProgressIndicator());
              }),
        ),
      ),
    );
  }
}
