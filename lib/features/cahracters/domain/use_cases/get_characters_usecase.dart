import 'package:characters_view/core/errors/failures.dart';
import 'package:characters_view/core/utils/either.dart';
import 'package:characters_view/core/utils/usecase.dart';
import 'package:characters_view/features/cahracters/domain/repositories/characters_repo.dart';

import '../entities/character.dart';

///[Single Responsibility Principle]
///[Open/Close Principle]
class GetCharactersUseCase implements UseCase<List<Character>,NoInput>{
  final CharactersRepo charactersRepo;

  GetCharactersUseCase({required this.charactersRepo});
  @override
  Future<Either<Failure,List<Character>>> call(NoInput input) 
  async=>await charactersRepo.fetchCharacters();
}