import 'package:characters_view/features/cahracters/domain/entities/character.dart';
///[Liskov Substitution Principle]
class CharacterModel extends Character {
  const CharacterModel(
      {required String id,
      String? name,
      String? actor,
      String? house,
      String? image})
      : super(id: id, actor: actor, name: name, image: image, house: house);
  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      house: json['house'],
      actor: json['actor'],
      image: json['image'],
    );
  }
}
