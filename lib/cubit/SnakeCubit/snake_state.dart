part of 'snake_cubit.dart';

sealed class SnakeState {}

final class SnakeInitial extends SnakeState {}

final class SnakeMove extends SnakeState {}
final class SnakeDead extends SnakeState {}
