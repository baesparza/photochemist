import 'package:flutter/material.dart';
import 'package:photochemist/widgets/displayChemistryEquation.dart';
import 'package:photochemist/widgets/whiteContainer.dart';

class SolutionEquationView extends StatelessWidget {
  const SolutionEquationView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ExpansionTile(
          title: Text('Métodos de Solución'),
          children: <Widget>[
            ListTile(
              title: Text(
                'Solución por Tanteo',
              ),
            ),
          ],
        ),
        WhiteContainer(
          children: <Widget>[
            ListTile(
              title: Text(
                'Solución por Tanteo',
                style: Theme.of(context).textTheme.headline,
              ),
            ),
            ListTile(
              title: DisplayChemistryEquation(rawEquationText: 'Na2SO3+HCl->NaCl+H2O+SO2'),
              subtitle: Text('Ecuación Original'),
            ),
            ListTile(
              title: DisplayChemistryEquation(rawEquationText: 'Na2SO3+HCl->2NaCl+H2O+SO2'),
              subtitle: Text('Ecuación Igualada'),
            ),
            ListTile(
              title: RaisedButton(
                child: Text('Cambiar Ecuacion'),
                onPressed: () {},
              ),
            )
          ],
        ),
        ListTile(
          title: FlatButton(
            child: Text(
              'Ha sido util la solución?',
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
