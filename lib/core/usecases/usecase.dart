import 'package:dartz/dartz.dart';
import 'package:demo_rvp4/core/error/failure.dart';
import 'package:equatable/equatable.dart';


// Parameters have to be put into a container object so that they can be
// included in this abstract base class method definition.
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

// This will be used by the code calling the use case whenever the use case
// doesn't accept any parameters.
class NoPrams extends Equatable {
  @override
  List<Object?> get props => [];
}
