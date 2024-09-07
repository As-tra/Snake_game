import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:snake_game/views/board_view.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const SnakeGame(),
    ),
  );
}

class SnakeGame extends StatelessWidget {
  const SnakeGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      home: const BoardView(),
    );
  }
}
