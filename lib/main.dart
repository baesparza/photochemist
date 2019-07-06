import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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

class PhotoChemistHome extends StatefulWidget {
  const PhotoChemistHome({
    Key key,
  }) : super(key: key);

  @override
  _PhotoChemistHomeState createState() => _PhotoChemistHomeState();
}

class _PhotoChemistHomeState extends State<PhotoChemistHome> {
  int _selectedIndex = 2;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  static List<Widget> _views = [
    /// Dummy container, no real use, just take 1 space
    Container(),
    new InputEquationView(),
    Placeholder(),
    ListView.builder(
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) => ListTile(
            title: Text('$index'),
          ),
    ),
    Center(
      child: Text('3'),
    ),
  ];

  void _onTappedItem(int index) {
    if (index == 0) {
      print('open menu');
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
            title: Text('Ecuacion'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            title: Text('Camara'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Solucion'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text('Libreta'),
          ),
        ],
        showUnselectedLabels: false,
        onTap: this._onTappedItem,
        currentIndex: this._selectedIndex,

        /// TODO: Remove this unused class

        unselectedItemColor: Theme.of(context).accentColor,
        selectedItemColor: Theme.of(context).accentColor,
      ),
    );
  }
}

class InputEquationView extends StatelessWidget {
  const InputEquationView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        children: <Widget>[
          Text(
            'Edita tu ecuación.'.toUpperCase(),
            style: Theme.of(context).textTheme.headline.copyWith(color: Colors.black),
          ),
          Container(height: 20),
          new TextField(
            decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey[800]),
                hintText: "2FeO+O2>Fe+H2O",
                fillColor: Colors.white70),
          ),
        ],
      ),
    );
  }
}
