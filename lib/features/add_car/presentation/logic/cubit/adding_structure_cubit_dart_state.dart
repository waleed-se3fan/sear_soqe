part of 'adding_structure_cubit_dart_cubit.dart';

sealed class AddingStructureCubitDartState extends Equatable {
  const AddingStructureCubitDartState();

  @override
  List<Object> get props => [];
}

final class AddingStructureCubitDartInitial
    extends AddingStructureCubitDartState {}

final class ChangeIndex extends AddingStructureCubitDartState {
  final int index;

  const ChangeIndex({required this.index});

  @override
  List<Object> get props => [index];
}
