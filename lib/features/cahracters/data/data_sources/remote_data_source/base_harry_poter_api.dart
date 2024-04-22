
import 'package:characters_view/features/cahracters/data/models/characters_model.dart';

import '../../models/character_model.dart';

abstract class HarryPotterApi{
  Future<List<CharacterModel>> fetchCharacters();
  Future<CharacterDetailsModel> getCharacterDetailsById({required String id});
}