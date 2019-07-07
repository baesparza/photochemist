import 'package:flutter/material.dart';
import 'package:photochemist/providers/homePageControl.dart';
import 'package:photochemist/screens/home/notebookView.dart';
import 'package:provider/provider.dart';

import 'package:photochemist/screens/home/cameraView.dart';
import 'package:photochemist/screens/home/inputEquationView.dart';
import 'package:photochemist/screens/home/solutionEquationView.dart';

class PhotoChemistHome extends StatelessWidget {
  const PhotoChemistHome({
    Key key,
  }) : super(key: key);

  /// different views used for this page.
  /// First class is a dummy container, no real use, just take 1 space
  static List<Widget> _views = [
    Container(),
    InputEquationView(),
    CameraView(),
    SolutionEquationView(),
    NotebookView(),
  ];

  /// activate different pages. and keep track when to open menu.

  @override
  Widget build(BuildContext context) {
    HomePageControl pageControl = Provider.of<HomePageControl>(context);

    return Scaffold(
      key: pageControl.scaffoldKey,
      body: PhotoChemistHome._views[pageControl.currentIndex],
      drawer: Drawer(),
      backgroundColor: Theme.of(context).backgroundColor,
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
        onTap: (int index) => pageControl.currentIndex = index,
        currentIndex: pageControl.currentIndex,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,

        /// TODO: Remove this unused class
        backgroundColor: Color(0xff783b60),
      ),
    );
  }
}
