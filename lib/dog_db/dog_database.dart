import 'dart:io';

import 'package:flutter_dogs/model/dogs.dart';
import 'package:flutter_dogs/networking/breeds_type_data.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'doggie_database.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE ${DogFieldsHelper.tableName}(id INTEGER PRIMARY KEY AUTOINCREMENT, breed TEXT, subBreed TEXT)');
    });
  }

  Future<int> insertALLDog(List<Dog> dogs) async {
    final db = await database;
    int result = 0;
    for (var dog in dogs) {
      result = await db.insert(DogFieldsHelper.tableName, dog.toMap());
    }
    return result;
  }

  Future<List<Dog>> getAllDogs() async {
    final db = await database;
    var res = await db.query(DogFieldsHelper.tableName);
    List<Dog> list =
        res.isNotEmpty ? res.map((e) => Dog.fromMap(e)).toList() : [];
    return list;
  }
}
Future<int> putDogsInDB() async {
  var dog = await breedsTypeData();
  return await DBProvider.db.insertALLDog(dog);
}