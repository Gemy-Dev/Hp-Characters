import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:characters_view/core/errors/exceptions.dart';
import 'package:characters_view/core/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:characters_view/features/cahracters/data/data_sources/remote_data_source/base_harry_poter_api.dart';
import 'package:characters_view/features/cahracters/data/models/characters_model.dart';

import '../../models/character_model.dart';

class HarryPotterApiImpl implements HarryPotterApi {
  final http.Client client;

  HarryPotterApiImpl({
    required this.client,
  });
  @override
  Future<List<CharacterModel>> fetchCharacters() async {
    try {
   
        final jsonData = await _helper(AppConstants.charactersEdndpoint) as List<dynamic>;

        return jsonData
            
            .map((item) => CharacterModel.fromJson(item))
            .toList();
     
    } catch (e) {
     
      throw ServerException();
    }
  }
  
  @override
  Future<CharacterDetailsModel> getCharacterDetailsById({required String id})async {
  try {
    final jsonData=await _helper('${AppConstants.characterDetailsEdndpoint}/$id')  ;
   
    return CharacterDetailsModel.fromJson(jsonData.first);
  } catch (e) {
   
     throw ServerException();
  }
  
  }


 Future  _helper<T>(String endPoint)async{
  
    final url =
          Uri.parse(AppConstants.baseUrl + endPoint);
      final response = await client.get(url);
      if (response.statusCode == HttpStatus.ok) {
        final jsonData = jsonDecode(response.body)as T ;
        log(jsonData.runtimeType.toString());
        return jsonData;
        }
        else {
        throw ServerException();
      }
 }
}
