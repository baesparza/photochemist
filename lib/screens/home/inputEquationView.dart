import 'package:flutter/material.dart';

class InputEquationView extends StatelessWidget {
  /// TODO: temporal var
  static const testInput = 'CH4+2O2->2H2O+CO2';

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
          new EquationInputField(testInput: testInput),
          Container(height: 40),
          new EquationDisplayTextMode(equationText: testInput),
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
  EquationDisplayTextMode({
    Key key,
    @required this.equationText,
  })  : assert(equationText != null),
        super(key: key) {
    Equation e = Equation.fromString(this.equationText);
    print(this.equationText);
    print(e.toString());
  }

// TODO: remove class attribute
  final String equationText;
  List<String> parsedEquation = [];

  @override
  Widget build(BuildContext context) {
    return Text(InputEquationView.testInput);
  }
}

abstract class Operate {
  String toString();
  void operate();
}

class Equation extends Operate {
  Part reactants;
  Part products;

  Equation.fromString(String rawEquation) {
    List<String> data = rawEquation.split(new RegExp(r'([->\,>\,=>])'));
    if (data.length != 3) return;
    this.reactants = new Part.fromString(data[0]);
    this.products = new Part.fromString(data[2]);
  }

  @override
  void operate() {
    // TODO: implement operate
  }

  @override
  String toString() {
    return '${this.reactants.toString()};>;${this.products.toString()}';
  }
}

class Part extends Operate {
  List<Compound> compounds = [];

  Part.fromString(String rawPart) {
    rawPart.split(new RegExp(r'([+])')).forEach((c) {
      this.compounds.insert(this.compounds.length, new Compound.fromString(c));
    });
  }

  @override
  void operate() {
    // TODO: implement operate
  }

  @override
  String toString() {
    String res = '';
    for (var i = 0; i < compounds.length; i++) {
      if (i > 0) res = '${res};+;';
      res = '${res}${compounds[i].toString()}';
    }
    return res;
  }
}

class Compound extends Operate {
  int numberOfMoleculesOfCompound = 1;
  List<String> elements = [];
  Compound.fromString(String rawCompound) {
    do {
      int indexOfLastCapitalLetter = rawCompound.lastIndexOf(new RegExp(r'([A-Z])'));
      if (indexOfLastCapitalLetter <= 0) {
        /// validate if not number to be added
        int tempNumber = int.tryParse(rawCompound);
        if (tempNumber == null)
          elements.insert(0, rawCompound);
        else
          numberOfMoleculesOfCompound = tempNumber;
        break;
      }
      elements.insert(0, rawCompound.substring(indexOfLastCapitalLetter));
      rawCompound = rawCompound.substring(0, indexOfLastCapitalLetter);
    } while (true);
  }

  @override
  void operate() {
    // TODO: implement operate
  }

  @override
  String toString() {
    String res =
        (this.numberOfMoleculesOfCompound == 1) ? '' : '${this.numberOfMoleculesOfCompound};';
    for (var i = 0; i < elements.length; i++) {
      res = '${res}${elements[i]}';
      if (i != elements.length - 1) res += ';';
    }
    return res;
  }
}
