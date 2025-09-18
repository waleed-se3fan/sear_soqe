import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'adding_structure_cubit_dart_state.dart';

class AddingStructureCubitDartCubit
    extends Cubit<AddingStructureCubitDartState> {
  AddingStructureCubitDartCubit() : super(AddingStructureCubitDartInitial());

  changeIndex(int index) {
    emit(ChangeIndex(index: index));
  }
}
