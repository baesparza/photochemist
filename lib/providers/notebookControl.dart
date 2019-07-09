import 'dart:core';
import 'package:flutter/material.dart';
import 'package:photochemist/models/equation.dart';
import 'package:photochemist/services/database-service.dart';

class NotebookControl with ChangeNotifier {
  NotebookControl()
      : _db = PhotoChemistDB(),
        _favorites = null,
        _history = null;

  final PhotoChemistDB _db;
  List<Equation> _history;
  List<Equation> _favorites;
  Equation _selectedEquation;

  get selectedEquation {
    return this._selectedEquation;
  }

  List<Equation> get history {
    if (this._history == null) {
      this._db.loadEquationHistory().then((list) {
        this._history = list;
        notifyListeners();
      });
    }
    return this._history;
  }

  List<Equation> get favorites {
    if (this._favorites == null) {
      this._db.loadEquationFavorites().then((list) {
        this._favorites = list;
        notifyListeners();
      });
    }
    return this._favorites;
  }

  void cleanHistory() {
    this._db.cleanHistory().then(
      () {
        this._history = null;
        notifyListeners();
      },
    );
  }

  // Future<List<Equation>> getFavorites() async {
  //   if (this._database == null) return [];
  //   List<Map> maps = await this._database.query(
  //         'Equations',
  //         where: 'isFavorite = 1',
  //       );
  //   print(maps);

  //   return maps.map((val) => Equation.fromMap(val)).toList();
  // }

  // Future<List<Equation>> getHistory() async {
  //   if (this._database == null) return [];
  //   List<Map> maps = await this._database.query(
  //         'Equations',
  //       );
  //   print(maps);

  //   return maps.map((val) => Equation.fromMap(val)).toList();
  // }

  // get favorites async {
  //   if (this._database == null) return [];
  //   List<Map> maps = await this._database.query('Equations');
  //   return maps.map((val) => Equation.fromMap(val)).toList();
  // }

  Equation addEquation(Equation equation) {
    this._db.addEquation(equation).then(
      (e) {
        this._selectedEquation = e;
        this._history = null;
        this._favorites = null;
        notifyListeners();
      },
    );
  }
}
