import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class InputEquationView extends StatelessWidget {
  /// TODO: temporal var
  static const testInput = 'CH4+2O2->2H2O+CO2+2FeO';

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
          Container(height: 30),
          EquationInputField(testInput: testInput),
          Container(height: 40),
          EquationDisplayTextMode(rawEquationText: testInput),
        ],
      ),
    );
  }
}

class EquationInputField extends StatelessWidget {
  const EquationInputField({
    Key key,
    @required this.testInput,
  }) : super(key: key);

  final String testInput;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: InputEquationView.testInput,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
        filled: true,
        hintStyle: TextStyle(color: Colors.grey[800]),
        hintText: "2FeO+O2>Fe+H2O",
        fillColor: Colors.white70,
      ),
    );
  }
}

class EquationDisplayTextMode extends StatelessWidget {
  final String rawEquationText;

  EquationDisplayTextMode({
    Key key,
    @required this.rawEquationText,
  })  : assert(rawEquationText != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.title,
        children: this._buildEquation(context),
      ),
    );
  }

  List<TextSpan> _buildEquation(BuildContext context) {
    List<String> data = this.rawEquationText.split(RegExp(r'([->\,>\,=>])'));
    if (data.length != 3) return [];
    return [
      ...this._buildPart(context, rawPartText: data[0]),
      TextSpan(text: '>'),
      ...this._buildPart(context, rawPartText: data[2]),
    ];
  }

  List<TextSpan> _buildPart(BuildContext context, {String rawPartText}) {
    List<String> compounds = rawPartText.split(RegExp(r'([+])'));

    return [
      for (var i = 0; i < compounds.length; i++)
        TextSpan(
          children: <TextSpan>[
            ...this._buildCompound(context, rawCompoundText: compounds[i]),
            if (i < compounds.length - 1) TextSpan(text: '+'),
          ],
        ),
    ];
  }

  List<TextSpan> _buildCompound(BuildContext context, {String rawCompoundText}) {
    int numberOfMoleculesOfCompound;
    List<String> elements = [];

    do {
      int indexOfLastCapitalLetter = rawCompoundText.lastIndexOf(RegExp(r'([A-Z])'));
      if (indexOfLastCapitalLetter <= 0) {
        /// validate if not number to be added
        int tempNumber = int.tryParse(rawCompoundText);
        if (tempNumber == null)
          elements.insert(0, rawCompoundText);
        else
          numberOfMoleculesOfCompound = tempNumber;
        break;
      }
      elements.insert(0, rawCompoundText.substring(indexOfLastCapitalLetter));
      rawCompoundText = rawCompoundText.substring(0, indexOfLastCapitalLetter);
    } while (true);

    return [
      if (numberOfMoleculesOfCompound != null)
        TextSpan(
          text: numberOfMoleculesOfCompound.toString(),
          style: Theme.of(context).textTheme.title,
        ),
      for (var element in elements)
        ...this._buildElementComponent(context, rawElementText: element),
    ];
  }

  List<TextSpan> _buildElementComponent(BuildContext context, {String rawElementText}) {
    String _element;
    String _subScript;

    int indexOfSubscript = rawElementText.lastIndexOf(RegExp(r'([0-9])'));

    /// if indexOfSubscript is different than '-1' means that the rawTextElement
    /// contains a number, thats considered to be subscript. So if thats the case
    /// split the String in two parts
    if (indexOfSubscript != -1) {
      _subScript = rawElementText.substring(indexOfSubscript);
      _element = rawElementText.substring(0, indexOfSubscript);
    } else {
      _element = rawElementText;
    }

    return [
      TextSpan(text: _element),
      if (_subScript != null)
        TextSpan(
          text: _subScript,
          style: Theme.of(context).textTheme.subtitle,
        ),
    ];
  }
}
