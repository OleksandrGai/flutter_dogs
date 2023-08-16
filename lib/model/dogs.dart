abstract class DogFieldsHelper {
  static const String tableName = 'dogs';
  static const String breed = 'breed';
  static const String subBreed = 'subBreed';
}

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

  Map<String, dynamic> toMap() => {
        DogFieldsHelper.breed: breed,
        DogFieldsHelper.subBreed: subBreed,
      };

  factory Dog.fromMap(Map<String, dynamic> json) => Dog(
        breed: json[DogFieldsHelper.breed],
        subBreed: json[DogFieldsHelper.subBreed],
      );
}
