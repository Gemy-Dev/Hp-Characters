import 'package:characters_view/core/errors/exceptions.dart';
import 'package:characters_view/core/errors/failures.dart';
import 'package:characters_view/core/utils/either.dart';
import 'package:characters_view/features/cahracters/data/data_sources/remote_data_source/base_harry_poter_api.dart';
import 'package:characters_view/features/cahracters/domain/entities/character_details.dart';
import 'package:characters_view/features/cahracters/domain/repositories/characters_repo.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/entities/character.dart';
///[Interface Segregation Principle]
class CharactersRepoImpl implements CharactersRepo {
  final HarryPotterApi harryPotterApi;
  final NetworkInfo networkInfo;
  CharactersRepoImpl({
    required this.harryPotterApi,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Character>>> fetchCharacters(
     ) async {
    if (!(await networkInfo.isConnected)) {
      return Either.left(NoInternetFailure());
    }
    try {
      final result = await harryPotterApi.fetchCharacters();
      return Either.right(result);
    } on ServerException {
      return Either.left(ServerFailure());
    } 
  }


  @override
  Future<Either<Failure, CharacterDetails>> getCharacterDetailsById(
      {required String id}) async {
    if (!(await networkInfo.isConnected)) {
      return Either.left(NoInternetFailure());
    }
    try {
      final result = await harryPotterApi.getCharacterDetailsById(id: id);
      return Either.right(result);
    } on ServerException {
      return Either.left(ServerFailure());
    }
  }
}
