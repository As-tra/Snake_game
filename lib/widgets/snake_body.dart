import 'package:flutter/material.dart';
import 'package:snake_game/constants.dart';

class SnakeBody extends StatelessWidget {
  const SnakeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: kCellWidth,
          height: kCellWidth,
          color: kSnakeColor,
        )
      ],
    );
  }
}
