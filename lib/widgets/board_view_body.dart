import 'package:flutter/material.dart';
import 'package:snake_game/widgets/snake_body.dart';

class BoardViewBody extends StatelessWidget {
  const BoardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        SnakeBody(),
      ],
    );
  }
}