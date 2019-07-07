import 'package:flutter/material.dart';

class WhiteContainer extends StatelessWidget {
  final Widget title;
  final List<Widget> children;

  const WhiteContainer({
    Key key,
    @required this.title,
    @required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const EdgeInsetsGeometry space = const EdgeInsets.symmetric(vertical: 20, horizontal: 15);
    return Container(
      margin: space,
      padding: space,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        children: <Widget>[
          DefaultTextStyle(
            child: this.title,
            style: Theme.of(context).textTheme.headline,
          ),
          Divider(height: 15),
          ...this.children,
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}
