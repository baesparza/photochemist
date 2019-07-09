import 'package:flutter/material.dart';

class HomePageControl with ChangeNotifier {
  int _currentIndex = 1;

  /// track state of current scaffold. Main purpose related to use of drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  final PageController _pageController = new PageController();

  HomePageControl() {
    this.pageController.addListener(() {
      this._currentIndex = this.pageController.page.toInt() + 1;
      BuildContext context = this._scaffoldKey.currentContext;
      FocusScope.of(context).requestFocus(new FocusNode());
      notifyListeners();
    });
  }

  set currentIndex(int index) {
    if (index == 0) {
      this._scaffoldKey.currentState?.openDrawer();
      return;
    }

    this._currentIndex = index;
    this.pageController.jumpToPage(index - 1);
    notifyListeners();
  }

  get pageController {
    return this._pageController;
  }

  get scaffoldKey {
    return this._scaffoldKey;
  }

  get currentIndex {
    return this._currentIndex;
  }
}
