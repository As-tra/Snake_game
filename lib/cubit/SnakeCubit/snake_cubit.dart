import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snake_game/constants.dart';

part 'snake_state.dart';

class SnakeCubit extends Cubit<SnakeState> {
  SnakeCubit() : super(SnakeInitial());

  List<int> snakePositions = [
    knumberOfColums + 1,
    knumberOfColums + 2,
    knumberOfColums + 3
  ];
  List<int> borderPositions = [];
  List<int> emptyPositions = [];
  int head = knumberOfColums + 3;
  String currentDirection = 'R';
  int points = 0;
  int lastRow = -1;
  int foodPosition = 170;

  Timer? myTimer;

  void createTheFood() {
    // create random index
    Random random = Random();
    int index = random.nextInt(emptyPositions.length);
    foodPosition = emptyPositions[index];
  }

  void paly() {
    myTimer = Timer.periodic(const Duration(milliseconds: 100), (time) {
      move(direction: currentDirection);
    });
  }

  void changeDirection({
    required String direction,
  }) {
    if (direction != currentDirection) {
      if (currentDirection == 'R' && direction != 'L') {
        currentDirection = direction;
      } else if (currentDirection == 'D' && direction != 'T') {
        currentDirection = direction;
      } else if (currentDirection == 'T' && direction != 'D') {
        currentDirection = direction;
      } else if (currentDirection == 'L' && direction != 'R') {
        currentDirection = direction;
      }
    }
  }

  void move({
    required String direction,
  }) {
    if ((currentDirection == 'R' && direction == 'L') ||
        (currentDirection == 'L' && direction == 'R') ||
        (currentDirection == 'T' && direction == 'D') ||
        (currentDirection == 'D' && direction == 'T')) {
      direction = currentDirection;
    }

    currentDirection = direction;

    if (currentDirection == 'R') {
      head++; // Move right
    } else if (currentDirection == 'L') {
      head--; // Move left
    } else if (currentDirection == 'T') {
      head -= knumberOfColums;
    } else if (currentDirection == 'D') {
      head += knumberOfColums;
    }

    if (head == foodPosition) {
      points++;
      createTheFood();
    } else {
      snakePositions.removeAt(0);
    }
    checkSnakePosition();
  }

  void checkSnakePosition() {
    if (borderPositions.contains(head) || snakePositions.contains(head)) {
      myTimer?.cancel();
      emit(SnakeDead());
    } else {
      snakePositions.add(head);
      emit(SnakeMove());
    }
  }

  void setBottomBorder({required double width, required double height}) {
    double cellWidth = width / knumberOfColums;
    int lastRow = height ~/ cellWidth - 1;
    // add the positions to the border list
    for (int i = lastRow * knumberOfColums;
        i < lastRow * (knumberOfColums + 1);
        i++) {
      borderPositions.add(i);
    }
  }

  Color getColor(int index) {
    if (index == head) {
      return kSnakeHead;
    } else if (snakePositions.contains(index)) {
      return kSnakeColor;
    } else if (index < knumberOfColums ||
        [0, knumberOfColums - 1].contains(index % knumberOfColums) ||
        borderPositions.contains(index)) {
      borderPositions.add(index);
      return kBorderColor;
    } else if (index == foodPosition) {
      return kFoodColor;
    } else {
      if (!emptyPositions.contains(index)) {
        emptyPositions.add(index);
      }
      return kBackground;
    }
  }
}
