import 'dart:io';

import 'package:flutter_dogs/model/dogs.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DogDatabaseProvider {
  static final DogDatabaseProvider db = DogDatabaseProvider._();
  Database? _database;

  DogDatabaseProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await getDataBaseInstance();

    return _database!;
  }

  Future<Database> getDataBaseInstance() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'dog');
    return openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
CREATE TABLE $dogTable (
id INTEGER PRIMARY KEY,
breed TEXT,
subBreed TEXT,
)
''');
    });
  }

  Future<List<Dog>> getAllDogs() async {
    final db = await database;
    var response = await db.query(dogTable);
    List<Dog> list = response.map((dog) => Dog.fromMap(dog)).toList();
    return list;
  }

  Future<Dog> addDogDataBase(Dog dog) async {
    final db = await database;
    var raw = await db.insert(
      dogTable,
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return dog.copy(id: raw);
  }
}
