import 'package:flutter/material.dart';
import 'package:photochemist/screens/home/photoChemistHome.dart';

void main() => runApp(PhotoChemistApp());

class PhotoChemistApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhotoChemist',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: PhotoChemistHome(),
    );
  }
}
