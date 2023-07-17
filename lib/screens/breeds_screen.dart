import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dogs/blocs/dog_breeds_bloc_directory/dog_breeds_bloc.dart';

import 'package:flutter_dogs/widgets/gridWidget.dart';

class BreedsScreen extends StatelessWidget {
  const BreedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DogBreedsBloc(),
      child: const DogBreedsView(),
    );
  }
}

class DogBreedsView extends StatelessWidget {
  const DogBreedsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: BlocBuilder<DogBreedsBloc, DogBreedsState>(
            builder: (context, state) {
              if (state is DogBreedsLoaded) {
                return GridTextWidget(listOfBreeds: state.dogBreedsList);
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
