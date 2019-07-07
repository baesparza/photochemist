import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:photochemist/widgets/displayChemistryEquation.dart';
import 'package:photochemist/widgets/whiteContainer.dart';

class InputEquationView extends StatefulWidget {
  const InputEquationView({
    Key key,
  }) : super(key: key);

  @override
  _InputEquationViewState createState() => _InputEquationViewState();
}

class _InputEquationViewState extends State<InputEquationView> {
  String input = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WhiteContainer(
        title: Text('Edita tu Ecuación'),
        children: <Widget>[
          TextField(
            onChanged: (newVal) {
              setState(() {
                this.input = newVal;
              });
            },
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
          ),
          Container(height: 40),
          DisplayChemistryEquation(rawEquationText: this.input),
          Container(height: 30),
          RaisedButton(
            child: Text('Continuar'),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

// class EquationInputField extends StatelessWidget {
//   const EquationInputField({
//     Key key,
//     @required this.testInput,
//   }) : super(key: key);

//   final String testInput;

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       onChanged: (newVal) => {},
//       keyboardType: TextInputType.text,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//           borderRadius: const BorderRadius.all(
//             const Radius.circular(10.0),
//           ),
//         ),
//         filled: true,
//         hintStyle: TextStyle(color: Colors.grey[800]),
//         hintText: "2FeO+O2>Fe+H2O",
//         fillColor: Colors.white70,
//       ),
//     );
//   }
// }
