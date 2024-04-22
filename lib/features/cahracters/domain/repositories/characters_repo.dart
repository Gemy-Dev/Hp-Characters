import 'package:characters_view/core/errors/failures.dart';
import 'package:characters_view/features/cahracters/domain/entities/character_details.dart';

import '../../../../core/utils/either.dart';
import '../entities/character.dart';

// Open/Closed Principle 
abstract class CharactersRepo{
  Future<Either<Failure,List<Character>>>  fetchCharacters();
  Future<Either<Failure,CharacterDetails>>  getCharacterDetailsById({required String id});
}