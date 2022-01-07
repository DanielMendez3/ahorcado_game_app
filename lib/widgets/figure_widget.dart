import 'package:flutter/material.dart';

class FigureWidget extends StatelessWidget {
  final String path;
  final bool visible;
  const FigureWidget({Key? key, required this.visible, required this.path})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: this.visible,
        child: Container(
          width: 250,
          height: 250,
          child: Image.asset(this.path),
        ));
  }
}
