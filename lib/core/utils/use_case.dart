import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sear_soqe/core/errors/error_model.dart';

abstract class UseCase<Type, Params> {
  Future<Either<ErrorModel, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
