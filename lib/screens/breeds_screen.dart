import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dogs/bloc/dog_breeds_bloc.dart';

import 'package:flutter_dogs/widgets/gridWidget.dart';

class BreedsScreen extends StatelessWidget {
  const BreedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DogBreedsBloc(),
      child: DogBreedsView(),
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
          body: BlocConsumer<DogBreedsBloc, DogBreedsState>(
              listener: (context, state) {
            if (state is DogBreedsLoaded) {
              context.read<DogBreedsBloc>().add(FetchedDogBreeds());
            }
          }, builder: (context, state) {
            if (state is DogBreedsLoaded) {
              return GridTextWidget(listOfBreeds: state.dogBreedsList);
            }
            return const Center(child: CircularProgressIndicator());
          }),
        ),
      ),
    );
  }
}
/*
class BreedsScreen extends StatefulWidget {
  const BreedsScreen({super.key});

  @override
  State<BreedsScreen> createState() => _BreedsScreenState();
}

class _BreedsScreenState extends State<BreedsScreen> {
  final bloc = DogBreedsBloc();

  @override
  void initState() {
    bloc.add(FetchedDogBreeds());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: BlocBuilder<DogBreedsBloc, DogBreedsState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is DogBreedsLoaded) {
                  return GridTextWidget(listOfBreeds: state.dogBreedsList);
                  return DogBreedsView();
                }
                return const Center(child: CircularProgressIndicator());
              }),
        ),
      ),
    );
  }
}
 */
