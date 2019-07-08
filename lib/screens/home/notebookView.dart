import 'package:flutter/material.dart';
import 'package:photochemist/models/equation.dart';
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
    NotebookControl noteBook = Provider.of<NotebookControl>(context);

    List<Widget> notificationList;
    if (noteBook.history == null) {
      notificationList = [
        ListTile(
          title: Text('Loading...'),
        )
      ];
    } else {
      notificationList = noteBook.history
          .map(
            (el) => ListTile(
                  title: DisplayChemistryEquation(rawEquationText: el.value),
                  enabled: true,
                  onTap: () {},
                ),
          )
          .toList();
    }

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
              // FutureBuilder(
              //   initialData: [],
              //   future: noteBook.getFavorites(),
              //   builder: (BuildContext context, AsyncSnapshot snapshot) {
              //     return Column(
              //       children: <Widget>[
              //         for (Equation el in snapshot.data)
              //           ListTile(
              //             title: DisplayChemistryEquation(rawEquationText: el.value),
              //             enabled: true,
              //             onTap: () {},
              //           ),
              //       ],
              //     );
              //   },
              // ),
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
              ...notificationList
            ],
          ),
        ],
      ),
    );
  }
}
