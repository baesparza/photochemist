import 'package:flutter/material.dart';

class DisplayChemistryEquation extends StatelessWidget {
  final String rawEquationText;

  DisplayChemistryEquation({
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
    List<String> data = this.rawEquationText.split(RegExp(r'([->\,>\,=>\,→\,=])'));
    if (data.length != 3) return [];
    return [
      ...this._buildPart(context, rawPartText: data[0]),
      TextSpan(
        text: '→',
        style: Theme.of(context).textTheme.body1.copyWith(
              fontSize: 30,
              letterSpacing: 5,
              height: 0,
            ),
      ),
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
            if (i < compounds.length - 1)
              TextSpan(
                text: '+',
                style: Theme.of(context).textTheme.body1.copyWith(
                      fontSize: 20,
                      letterSpacing: 5,
                    ),
              ),
          ],
        ),
    ];
  }

  List<TextSpan> _buildCompound(BuildContext context, {String rawCompoundText}) {
    int coefficient;
    List<String> elements = [];

    do {
      int indexOfLastCapitalLetter = rawCompoundText.lastIndexOf(RegExp(r'([A-Z])'));
      if (indexOfLastCapitalLetter <= 0) {
        /// validate if not number to be added by validating if the remaining text of the original string
        /// can be parsed to a number
        int tempNumber = int.tryParse(rawCompoundText);
        if (tempNumber == null)
          elements.insert(0, rawCompoundText);
        else
          coefficient = tempNumber;
        break;
      }
      elements.insert(0, rawCompoundText.substring(indexOfLastCapitalLetter));
      rawCompoundText = rawCompoundText.substring(0, indexOfLastCapitalLetter);
    } while (true);

    return [
      if (coefficient != null)
        TextSpan(
            text: coefficient.toString(),
            style: Theme.of(context).textTheme.headline.copyWith(
                  letterSpacing: 3,
                  fontWeight: FontWeight.w500,
                )),
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
      TextSpan(
          text: _element, style: Theme.of(context).textTheme.title.copyWith(letterSpacing: 0.6)),
      if (_subScript != null)
        TextSpan(
          text: _subScript,
          style: Theme.of(context).textTheme.subtitle,
        ),
    ];
  }
}
