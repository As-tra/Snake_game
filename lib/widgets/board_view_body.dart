import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snake_game/constants.dart';
import 'package:snake_game/cubit/SnakeCubit/snake_cubit.dart';
import 'package:snake_game/widgets/controll_buttons.dart';

class BoardViewBody extends StatefulWidget {
  const BoardViewBody({super.key});

  @override
  State<BoardViewBody> createState() => _BoardViewBodyState();
}

class _BoardViewBodyState extends State<BoardViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<SnakeCubit>().paly();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SnakeCubit, SnakeState>(
      builder: (context, state) {
        if (state is SnakeDead) {
          return const Text("Game Over");
        } else {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Points : ${BlocProvider.of<SnakeCubit>(context).points}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    LayoutBuilder(builder: (context, constraints) {
                      BlocProvider.of<SnakeCubit>(context).setBottomBorder(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight,
                      );
                      return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: knumberOfColums,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 0,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: BlocProvider.of<SnakeCubit>(context)
                                  .getColor(index),
                            ),
                          );
                        },
                      );
                    }),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: ControllerButtons(),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
