import 'package:flutter/material.dart';
import 'package:photochemist/providers/notebookControl.dart';
import 'package:photochemist/widgets/displayChemistryEquation.dart';
import 'package:photochemist/widgets/whiteContainer.dart';
import 'package:provider/provider.dart';

class NotebookView extends StatelessWidget {
  const NotebookView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotebookControl notebookControl = Provider.of<NotebookControl>(context);

    return SafeArea(
      child: ListView(
        children: <Widget>[
          WhiteContainer(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Favoritos',
                  style: Theme.of(context).textTheme.headline,
                ),
              ),
              for (Equation el in notebookControl.favorites)
                ListTile(
                  title: DisplayChemistryEquation(rawEquationText: el.rawText),
                  enabled: true,
                  onTap: () {},
                ),
            ],
          ),
          WhiteContainer(
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
              for (Equation el in notebookControl.history)
                ListTile(
                  title: DisplayChemistryEquation(rawEquationText: el.rawText),
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
