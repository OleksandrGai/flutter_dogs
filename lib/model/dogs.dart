final String dogTable = 'dog';

class DogFields {
  static final String id = '_id';
  static final String breed = 'breed';
  static final String subBreed = 'subBreed';
}

class Dog {
  Dog({
    this.id,
    required this.breed,
    this.subBreed,
  });

  int? id;
  final String breed;
  final String? subBreed;

  String get fullBreed =>
      '${(subBreed) ?? ''} ${breed?[0].toUpperCase()}${breed?.substring(1)}'
          .trim();

  String get imageUrlPath => subBreed == null ? breed : '$breed/$subBreed';

  Map<String, dynamic> toMap() => {
        DogFields.id: id,
        DogFields.breed: breed,
        DogFields.subBreed: subBreed,
      };

  factory Dog.fromMap(Map<String, dynamic> json) => Dog(
        id: json[DogFields.id],
        breed: json[DogFields.breed],
        subBreed: json[DogFields.subBreed],
      );

  Dog copy({
    int? id,
    String? breed,
    String? subBreed,
  }) =>
      Dog(
        id: id ?? this.id,
        breed: breed ?? this.breed,
        subBreed: subBreed ?? this.subBreed,
      );
}
