import 'package:flutter/material.dart';

class WhiteContainer extends StatelessWidget {
  final List<Widget> children;

  const WhiteContainer({
    Key key,
    @required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const EdgeInsetsGeometry space = const EdgeInsets.symmetric(vertical: 20, horizontal: 15);

    return Container(
      margin: space,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        children: this.children,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}
