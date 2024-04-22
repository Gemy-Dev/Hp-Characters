import 'package:characters_view/core/utils/usecase.dart';
import 'package:characters_view/features/cahracters/domain/entities/character_details.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/either.dart';
import '../repositories/characters_repo.dart';

///[Single Responsibility Principle]
///[Open/Close Principle]
class GetCharacterDetailsUseCase implements UseCase<CharacterDetails,String>{
  final CharactersRepo charactersRepo;


  GetCharacterDetailsUseCase({required this.charactersRepo});

  @override
  Future<Either<Failure,CharacterDetails>> call( String id) async=>
                        await charactersRepo.getCharacterDetailsById(id: id);
}