import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photochemist/providers/homePageControl.dart';
import 'package:photochemist/providers/notebookControl.dart';
import 'package:photochemist/providers/selectedEquation.dart';
import 'package:photochemist/screens/home/photoChemistHome.dart';
import 'package:provider/provider.dart';

void main() => runApp(PhotoChemistApp());

class PhotoChemistApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context) => HomePageControl(),
        ),
        ChangeNotifierProvider(
          builder: (comtext) => SelectedEquation(),
        ),
      ],
      child: MaterialApp(
        title: 'PhotoChemist',
        debugShowCheckedModeBanner: false,
        theme: PhotoChemistApp._buildAppTheme(),
        home: PhotoChemistHome(),
      ),
    );
  }

  static ThemeData _buildAppTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      primaryColor: Color(0xff330867),
      // accentColor: Color(0xff30cfd0),
      backgroundColor: Colors.grey.shade100,

      // text theme
      textTheme: _buildTextTheme(base: base.textTheme),
      primaryTextTheme: _buildTextTheme(base: base.primaryTextTheme, color: Colors.white),
      // accentTextTheme: _buildTextTheme(base: base.accentTextTheme, color: Colors.white),

      // icon theme
      iconTheme: base.iconTheme.copyWith(color: Colors.black),
      primaryIconTheme: base.iconTheme.copyWith(color: Colors.white),
      // accentIconTheme: base.iconTheme.copyWith(color: Colors.white),
    );
  }

  static TextTheme _buildTextTheme({
    TextTheme base,
    Color color = Colors.black,
  }) {
    return base
        .copyWith(
          headline: base.headline.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 21,
          ),
          title: base.title.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
          ),
          caption: base.caption.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
          overline: base.overline.copyWith(
            fontSize: 13.0,
          ),
        )
        .apply(
          displayColor: color,
          bodyColor: color,
        );
  }
}
