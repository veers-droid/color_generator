
import 'dart:math';

import 'package:flutter/material.dart';

class ColorChanger extends StatefulWidget {
  const ColorChanger({super.key});

  @override
  State<StatefulWidget> createState() => _ColorChangerState();

}

const int maxColorValue = 256;
const int defaultAlpha = 255;
const int defaultRadix = 16;
const String blackColorHex = "ff000000";

class _ColorChangerState extends State<ColorChanger> {
  Color _backgroundColor  = Colors.white;
  final _random = Random();

  void _changeColor() {
    setState(() {
      _backgroundColor = Color.fromARGB(
          defaultAlpha,
          _random.nextInt(maxColorValue),
          _random.nextInt(maxColorValue),
          _random.nextInt(maxColorValue));
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColor,
      child: Scaffold(
        backgroundColor: _backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  "Hello there",
              ),
              Text(
                "Current color in HEX: ${_backgroundColor.toARGB32().toRadixString(defaultRadix)}"
              )
            ],
          )
        ),
      )
    );
  }

}