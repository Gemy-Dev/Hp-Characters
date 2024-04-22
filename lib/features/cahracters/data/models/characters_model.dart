import '../../domain/entities/character_details.dart';
import 'wand_model.dart';
///[Liskov Substitution Principle]
class CharacterDetailsModel extends CharacterDetails {
  const CharacterDetailsModel({
    String? id,
    String? name,
    List<dynamic>? alternateNames,
    String? species,
    String? gender,
    String? house,
    String? dateOfBirth,
    int? yearOfBirth,
    bool? wizard,
    String? ancestry,
    String? eyeColour,
    String? hairColour,
    WandModel? wandModel,
    String? patronus,
    bool? hogwartsStudent,
    bool? hogwartsStaff,
    String? actor,
    List<String>? alternateActors,
    bool? alive,
    String? image,
  }) : super(
            id: id,
            name: name,
            alternateNames: alternateNames,
            species: species,
            gender: gender,
            house: house,
            dateOfBirth: dateOfBirth,
            yearOfBirth: yearOfBirth,
            wizard: wizard,
            ancestry: ancestry,
            eyeColour: eyeColour,
            hairColour: hairColour,
            wand: wandModel,
            patronus: patronus,
            hogwartsStudent: hogwartsStudent,
            hogwartsStaff: hogwartsStaff,
            actor: actor,
            alternateActors: alternateActors,
            alive: alive,
            image: image);

  factory CharacterDetailsModel.fromJson(Map<String, dynamic> json) {
    return CharacterDetailsModel(
      id: json['id'],
      name: json['name'],
      alternateNames: json['alternate_names'],
      species: json['species'],
      gender: json['gender'],
      house: json['house'],
      dateOfBirth: json['dateOfBirth'],
      yearOfBirth: json['yearOfBirth'],
      wizard: json['wizard'],
      ancestry: json['ancestry'],
      eyeColour: json['eyeColour'],
      hairColour: json['hairColour'],
      wandModel: json['wand'] != null ? WandModel.fromJson(json['wand']) : null,
      patronus: json['patronus'],
      hogwartsStudent: json['hogwartsStudent'],
      hogwartsStaff: json['hogwartsStaff'],
      actor: json['actor'],
      alternateActors: (json['alternate_actors'] != null)
          ? json['alternate_actors'].forEach((v) {
              json['alternate_actors']!.add(v);
            })
          : [],
      alive: json['alive'],
      image: json['image'],
    );
  }



}
