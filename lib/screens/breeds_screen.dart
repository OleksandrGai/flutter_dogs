import 'package:flutter/material.dart';
import 'package:flutter_dogs/widgets/gridWidget.dart';

import '../data from the internet/breeds_type_data.dart';

class BreedsScreen extends StatefulWidget {
  const BreedsScreen({super.key});

  @override
  State<BreedsScreen> createState() => _BreedsScreenState();
}

class _BreedsScreenState extends State<BreedsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                return snapshot.data != null
                    ? GridTextWidget(listOfBreeds: snapshot.data!)
                    : const Center(child: CircularProgressIndicator());
              }),
        ),
      ),
    );
  }
}
