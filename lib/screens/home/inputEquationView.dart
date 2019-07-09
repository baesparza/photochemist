import 'package:flutter/material.dart';
import 'package:photochemist/models/equation.dart';
import 'package:photochemist/providers/homePageControl.dart';
import 'package:photochemist/providers/notebookControl.dart';
import 'package:photochemist/widgets/displayChemistryEquation.dart';
import 'package:photochemist/widgets/whiteContainer.dart';
import 'package:provider/provider.dart';

class InputEquationView extends StatefulWidget {
  const InputEquationView({
    Key key,
  }) : super(key: key);

  @override
  _InputEquationViewState createState() => _InputEquationViewState();
}

class _InputEquationViewState extends State<InputEquationView> {
  String input = '2FeO+O2>Fe+H2O';
  @override
  Widget build(BuildContext context) {
    NotebookControl noteBook = Provider.of<NotebookControl>(context);
    HomePageControl homePageControl = Provider.of<HomePageControl>(context);

    Function continueBtnAction = () async {
      /// create new equation
      Equation e = Equation(value: this.input);
      e = await noteBook.addEquation(e);
      homePageControl.currentIndex = 3;
    };

    return SafeArea(
      child: WhiteContainer(
        children: <Widget>[
          ListTile(
            title: Text(
              'Edita tu Ecuación',
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          ListTile(
            title: TextField(
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
          ),
          ListTile(
            title: DisplayChemistryEquation(rawEquationText: this.input),
          ),
          ListTile(
            title: RaisedButton(
              child: Text('Continuar'),
              onPressed: continueBtnAction,
            ),
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
