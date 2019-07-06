import 'package:flutter/material.dart';
import 'package:photochemist/screens/home/cameraView.dart';
import 'package:photochemist/screens/home/equationHistoryView.dart';
import 'package:photochemist/screens/home/inputEquationView.dart';
import 'package:photochemist/screens/home/solutionEquationView.dart';

class PhotoChemistHome extends StatefulWidget {
  const PhotoChemistHome({
    Key key,
  }) : super(key: key);

  @override
  _PhotoChemistHomeState createState() => _PhotoChemistHomeState();
}

class _PhotoChemistHomeState extends State<PhotoChemistHome> {
  /// current activated page
  int _selectedIndex = 2;

  /// track state of current scaffold. Main purpose related to use of drawer
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  /// different views used for this page.
  /// First class is a dummy container, no real use, just take 1 space
  static List<Widget> _views = [
    Container(),
    InputEquationView(),
    CameraView(),
    SolutionEquationView(),
    EquationHistory(),
  ];

  /// activate different pages. and keep track when to open menu.
  void _onTappedItem(int index) {
    if (index == 0) {
      this._scaffoldKey.currentState?.openDrawer();
      return;
    }
    setState(() {
      this._selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: this._scaffoldKey,
      body: _PhotoChemistHomeState._views[this._selectedIndex],
      drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text('Menu'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.input),
            title: Text('Ecuación'),
            backgroundColor: Color(0xff29274f),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            title: Text('Cámara'),
            backgroundColor: Color(0xff783b60),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Solución'),
            backgroundColor: Color(0xff1b3643),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text('Libreta'),
            backgroundColor: Color(0xff1f4949),
          ),
        ],
        showUnselectedLabels: false,
        onTap: this._onTappedItem,
        currentIndex: this._selectedIndex,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,

        /// TODO: Remove this unused class
        backgroundColor: Color(0xff783b60),
      ),
    );
  }
}
