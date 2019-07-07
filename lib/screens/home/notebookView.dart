import 'package:flutter/material.dart';
import 'package:photochemist/widgets/displayChemistryEquation.dart';
import 'package:photochemist/widgets/whiteContainer.dart';

class NotebookView extends StatelessWidget {
  const NotebookView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration containerDecorations = BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(5)),
    );

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 9),
        children: <Widget>[
          WhiteContainer(
            title: Text('Favoritos'),
            children: <Widget>[
              ListTile(
                onLongPress: () {},
                title: DisplayChemistryEquation(rawEquationText: 'C4=>2H2O'),
                enabled: true,
                onTap: () {},
              ),
              ListTile(
                title: DisplayChemistryEquation(rawEquationText: 'H2O+C4=>2H2O'),
                enabled: true,
                onTap: () {},
              ),
              ListTile(
                title: DisplayChemistryEquation(rawEquationText: 'H2O+C4=>2H2O'),
                enabled: true,
                onTap: () {},
              ),
              ListTile(
                title: DisplayChemistryEquation(rawEquationText: 'H2O+C4=>2H2O'),
                enabled: true,
                onTap: () {},
              ),
            ],
          ),
          SizedBox(height: 40),
          WhiteContainer(
            title: Text('Historial'),
            children: <Widget>[
              ListTile(
                title: Text(
                  'Historial',
                  style: Theme.of(context).textTheme.headline,
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete_forever),
                  onPressed: () {},
                ),
              ),
              ListTile(
                title: DisplayChemistryEquation(rawEquationText: 'H2O+C4=>2H2O'),
                enabled: true,
                onTap: () {},
              ),
              ListTile(
                title: DisplayChemistryEquation(rawEquationText: 'H2O+C4=>2H2O'),
                enabled: true,
                onTap: () {},
              ),
              ListTile(
                title: DisplayChemistryEquation(rawEquationText: 'H2O+C4=>2H2O'),
                enabled: true,
                onTap: () {},
              ),
              ListTile(
                title: DisplayChemistryEquation(rawEquationText: 'H2O+C4=>2H2O'),
                enabled: true,
                onTap: () {},
              ),
              ListTile(
                title: DisplayChemistryEquation(rawEquationText: 'H2O+C4=>2H2O'),
                enabled: true,
                onTap: () {},
              ),
              ListTile(
                title: DisplayChemistryEquation(rawEquationText: 'H2O+C4=>2H2O'),
                enabled: true,
                onTap: () {},
              ),
              ListTile(
                title: DisplayChemistryEquation(rawEquationText: 'H2O+C4=>2H2O'),
                enabled: true,
                onTap: () {},
              ),
              ListTile(
                title: DisplayChemistryEquation(rawEquationText: 'H2O+C4=>2H2O'),
                enabled: true,
                onTap: () {},
              ),
              ListTile(
                title: DisplayChemistryEquation(rawEquationText: 'H2O+C4=>2H2O'),
                enabled: true,
                onTap: () {},
              ),
              ListTile(
                title: DisplayChemistryEquation(rawEquationText: 'H2O+C4=>2H2O'),
                enabled: true,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
