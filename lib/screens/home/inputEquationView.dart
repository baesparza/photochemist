import 'package:flutter/material.dart';

class InputEquationView extends StatelessWidget {
  const InputEquationView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 25),
        children: <Widget>[
          Text(
            'Edita tu Ecuación',
            style: Theme.of(context).textTheme.display1.copyWith(color: Colors.black),
          ),
          Container(height: 40),
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
