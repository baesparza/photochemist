import 'dart:async';

import 'package:photochemist/models/equation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/// Manage connection to db using singleton pattern.

class PhotoChemistDB {
  static final PhotoChemistDB _photoChemistDB = PhotoChemistDB._internal();

  PhotoChemistDB._internal();

  factory PhotoChemistDB() {
    return _photoChemistDB;
  }

  Database _database;

  Future<void> _loadBD() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'photochemist.db');

    this._database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
        create table Equations (
          id integer primary key autoincrement,
          value text not null,
          solution text,
          isFavorite integer not null,
          createdAt date not null)
          ''');
      },
    );
    // Delete the database
    await deleteDatabase(path);
    this._database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
        create table Equations (
          id integer primary key autoincrement,
          value text not null,
          solution text,
          isFavorite integer not null,
          createdAt date not null)
          ''');
      },
    );
  }

  loadEquationFavorites() async {
    if (this._database == null) await this._loadBD();

    List<Map> res = await this._database.query(
          'Equations',
          where: 'isFavorite = 1 and createdAt is not null',
          orderBy: 'createdAt',
        );
    return res.map((val) => Equation.fromMap(val)).toList();
  }

  loadEquationHistory() async {
    if (this._database == null) await this._loadBD();

    List<Map> res = await this._database.query(
          'Equations',
          orderBy: 'createdAt',
          where: 'createdAt is not null',
        );
    return res.map((val) => Equation.fromMap(val)).toList();
  }

  cleanHistory() async {
    if (this._database == null) await this._loadBD();

    this._database.rawDelete('DELETE FROM Equations WHERE isFavorite =0');
  }

  addEquation(Equation e) async {
    int id = await this._database.insert('Equations', e.toMap());
    return Equation.fromEquation(id, e);
  }
}
