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

  Future<void> _loadBD() async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'photochemist.db');

    this._database = await openDatabase(
      path,
      version: 2,
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

    notifyListeners();
  }

  Future<List<Equation>> getFavorites() async {
    if (this._database == null) return [];
    List<Map> maps = await this._database.query(
          'Equations',
          where: 'isFavorite = 1',
        );
    print(maps);

    return maps.map((val) => Equation.fromMap(val)).toList();
  }

  Future<List<Equation>> getHistory() async {
    if (this._database == null) return [];
    List<Map> maps = await this._database.query(
          'Equations',
        );
    print(maps);

    return maps.map((val) => Equation.fromMap(val)).toList();
  }

  get favorites async {
    if (this._database == null) return [];
    List<Map> maps = await this._database.query('Equations');
    return maps.map((val) => Equation.fromMap(val)).toList();
  }

  Future<Equation> addEquation(Equation equation) async {
    int id = await this._database.insert('Equations', equation.toMap());
    notifyListeners();
    return Equation.fromEquation(id, equation);
  }
}
