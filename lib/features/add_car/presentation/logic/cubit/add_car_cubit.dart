import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_car_state.dart';

class AddCarCubit extends Cubit<AddCarState> {
  AddCarCubit() : super(AddCarInitial());

  changeIndex(int index) {
    emit(ChangeIndex(index: index));
  }
}
