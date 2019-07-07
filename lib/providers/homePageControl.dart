import 'package:flutter/material.dart';

class HomePageControl with ChangeNotifier {
  int _currentIndex = 2;

  /// track state of current scaffold. Main purpose related to use of drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  get scaffoldKey {
    return this._scaffoldKey;
  }

  get currentIndex {
    return this._currentIndex;
  }

  set currentIndex(int index) {
    if (index == 0) {
      this._scaffoldKey.currentState?.openDrawer();
      return;
    }

    this._currentIndex = index;
    notifyListeners();
  }
}
