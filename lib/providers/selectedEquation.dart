import 'package:flutter/material.dart';
import 'package:photochemist/models/equation.dart';

class SelectedEquation with ChangeNotifier {
  Equation _currentEquation;

  get currentEquation {
    return this._currentEquation;
  }

  set currentEquation(Equation e) {
    this._currentEquation = e;
    notifyListeners();
  }
}
