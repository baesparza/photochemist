import 'dart:core';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class NotebookControl with ChangeNotifier {
  Database _database;
  NotebookControl() {
    this._loadBD();
  }

  Future<void> _loadBD() async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'photochemist.db');

    Database database =
        await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    });

// Insert some records in a transaction
    await database.transaction((txn) async {
      int id1 = await txn
          .rawInsert('INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
      print('inserted1: $id1');
      int id2 = await txn.rawInsert(
          'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)', ['another name', 12345678, 3.1416]);
      print('inserted2: $id2');
    });

// Update some record
    int count = await database.rawUpdate('UPDATE Test SET name = ?, VALUE = ? WHERE name = ?',
        ['updated name', '9876', 'some name']);
    print('updated: $count');

// Get the records
    List<Map> list = await database.rawQuery('SELECT * FROM Test');
    List<Map> expectedList = [
      {'name': 'updated name', 'id': 1, 'value': 9876, 'num': 456.789},
      {'name': 'another name', 'id': 2, 'value': 12345678, 'num': 3.1416}
    ];
    print(list);
    print(expectedList);

// Count the records
    count = Sqflite.firstIntValue(await database.rawQuery('SELECT COUNT(*) FROM Test'));
    print(count);

// Close the database
    await database.close();

    //  this._database = await openDatabase(
    //   path,
    //   version: 1,
    //   onCreate: (Database db, int version) async {
    //     // When creating the db, create the table
    //     await db.execute(
    //         'CREATE TABLE Equations (id INTEGER PRIMARY KEY, value TEXT, solution TEXT, isFavorite BOOLEAN)');
    //   },
    // );
    notifyListeners();
  }

  List<Equation> _history = [
    Equation('C4=>2H2O'),
    Equation('C4=>2H2O'),
    Equation('C4=>2H2O'),
    Equation('C4=>2H2O'),
    Equation('C4=>2H2O'),
    Equation('C4=>2H2O'),
    Equation('C4=>2H2O'),
  ];

  get history {
    print(this._database);

    if (this._database == null) return null;
  }

  get favorites {
    return this._history.where((equation) => equation.isFavorite);
  }
}

class Equation {
  String rawText;
  bool isFavorite = true;

  Equation(this.rawText);
}
