import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:dfa_shop/core/network/failure.dart';

abstract class BaseUseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
