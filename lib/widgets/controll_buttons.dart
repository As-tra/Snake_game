import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snake_game/cubit/SnakeCubit/snake_cubit.dart';

class ControllerButtons extends StatelessWidget {
  const ControllerButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(.2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              BlocProvider.of<SnakeCubit>(context).changeDirection(
                direction: 'T',
              );
            },
            icon: const Icon(
              Icons.arrow_upward,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  BlocProvider.of<SnakeCubit>(context).changeDirection(
                    direction: 'L',
                  );
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 30),
              IconButton(
                onPressed: () {
                  BlocProvider.of<SnakeCubit>(context).changeDirection(
                    direction: 'R',
                  );
                },
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              BlocProvider.of<SnakeCubit>(context).changeDirection(
                direction: 'D',
              );
            },
            icon: const Icon(
              Icons.arrow_downward,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
