part of 'add_car_cubit.dart';

sealed class AddCarState extends Equatable {
  const AddCarState();

  @override
  List<Object> get props => [];
}

final class AddCarInitial extends AddCarState {}

final class ChangeIndex extends AddCarState {
  final int index;

  const ChangeIndex({required this.index});

  @override
  List<Object> get props => [index];
}
