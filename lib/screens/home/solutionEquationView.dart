import 'package:flutter/material.dart';

class SolutionEquationView extends StatelessWidget {
  const SolutionEquationView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) => ListTile(
            title: Text('$index'),
          ),
    );
  }
}
