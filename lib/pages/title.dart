import 'package:flutter/material.dart';

class Titles extends StatelessWidget {
  const Titles({super.key});

  static const double _size = 60;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'todos',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: _size,
            fontWeight: FontWeight.w100,
          ),
        ),
        Icon(
          Icons.check,
          size: _size,
        ),
      ],
    );
  }
}
