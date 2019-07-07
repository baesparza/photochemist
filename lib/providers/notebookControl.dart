import 'dart:core';
import 'package:flutter/material.dart';
import 'package:photochemist/models/equation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class NotebookControl with ChangeNotifier {
  Database _database;
  NotebookControl() {
    this._loadBD();
  }
  Future<void> open(String path) async {
    this._database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
        create table Equations (
          id integer primary key autoincrement,
          value text not null,
          solution text,
          isFavorite integer not null)
          ''');
      },
    );
  }

  Future<void> _loadBD() async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'photochemist.db');

    this._database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE Equations (id INTEGER PRIMARY KEY, value TEXT, solution TEXT, isFavorite BOOLEAN)');
      },
    );

    notifyListeners();
  }

  get history {
    if (this._database == null) return null;
  }

  get favorites {
    // return this._history.where((equation) => equation.isFavorite);
  }

  Future<void> addEquation(Equation equation) async {
    await this._database.insert('Equations', equation.toMap());
    notifyListeners();
  }
}
