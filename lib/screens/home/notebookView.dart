import 'package:flutter/material.dart';
import 'package:photochemist/models/equation.dart';
import 'package:photochemist/providers/homePageControl.dart';
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
            (el) => WhiteListTile(
                  equation: el,
                ),
          )
          .toList();
    }

    List<Widget> favoritesList;
    if (noteBook.favorites == null) {
      favoritesList = [
        ListTile(
          title: Text('Loading...'),
        )
      ];
    } else {
      favoritesList = noteBook.favorites
          .map(
            (el) => WhiteListTile(
                  equation: el,
                ),
          )
          .toList();
    }

    Function cleanHistoryFunction = () {
      noteBook.cleanHistory();
    };

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
              ...favoritesList
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
                  onPressed: cleanHistoryFunction,
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

class WhiteListTile extends StatelessWidget {
  final Equation equation;

  const WhiteListTile({
    Key key,
    this.equation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageControl homePageControl = Provider.of<HomePageControl>(context);

    Widget fab;
    if (this.equation.isFavorite) {
      fab = Icon(
        Icons.star,
        color: Colors.yellow,
      );
    }

    return ListTile(
      leading: fab,
      title: DisplayChemistryEquation(rawEquationText: equation.value),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        homePageControl.currentIndex = 3;
      },
    );
  }
}
