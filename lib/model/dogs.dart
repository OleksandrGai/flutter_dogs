class Dog {
  Dog({
    required this.breed,
    this.subBreed,
  });

  final String breed;
  final String? subBreed;

  String get fullBreed =>
      '${(subBreed) ?? ''} ${breed?[0].toUpperCase()}${breed?.substring(1)}'
          .trim();

  String get imageUrlPath => subBreed == null ? breed : '$breed/$subBreed';
}
