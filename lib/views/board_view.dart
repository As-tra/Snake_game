import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snake_game/cubit/SnakeCubit/snake_cubit.dart';
import 'package:snake_game/widgets/board_view_body.dart';

class BoardView extends StatelessWidget {
  const BoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SnakeCubit(),
        child: const SafeArea(
          child: BoardViewBody(),
        ),
      ),
    );
  }
}
