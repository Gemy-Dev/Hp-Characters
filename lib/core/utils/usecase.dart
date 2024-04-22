import 'package:characters_view/core/utils/either.dart';
import 'package:equatable/equatable.dart';

import '../errors/failures.dart';

abstract class UseCase<Output, Input> {
  Future<Either<Failure, Output>> call(Input input);
}
class NoInput extends Equatable{
  @override

  List<Object?> get props =>[];
}