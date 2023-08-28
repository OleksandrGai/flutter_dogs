import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/dogs.dart';

class DogsDb {

  static const _tableName = 'dogs';

  final Future<Database> _db = getDatabasesPath().then((path) {
    return openDatabase(
      join(path, 'doggie_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE IF NOT EXISTS $_tableName(id INTEGER PRIMARY KEY, breed TEXT, sub_breed TEXT)',
        );
      },
      version: 1,
    );
  });

  Future<int> insert(Dog dog) {
    return _db.then((db) {
      return _insert(db, dog);
    });
  }

  Future<int> _insert(DatabaseExecutor executor, Dog dog) {
    return executor.insert(_tableName, dog.toMap());
  }

  Future insertAll(List<Dog> dogs) {
    print('Start insert: ${DateTime.timestamp()}');
    return _db.then((db) {
      return db.transaction((txn) async {
        return Future.wait([
          for (final dog in dogs)
            _insert(txn, dog)
        ]).then((value) {
          print('End insert: ${DateTime.timestamp()}');
          return value;
        });
      });
    });
  }

  Future<List<Dog>> dogs() async {
    return _db.then((db) {
      return db.query(_tableName).then((maps) {
        return List.generate(maps.length, (index) {
          return Dog(
            breed: maps[index]['breed'] as String,
            subBreed: maps[index]['sub_breed'] as String?,
          );
        });
      });
    });
  }
}

extension _DogToMap on Dog {
  Map<String, Object> toMap() => {
    'breed': breed,
    if (subBreed != null) 'sub_breed': subBreed!
  };
}



