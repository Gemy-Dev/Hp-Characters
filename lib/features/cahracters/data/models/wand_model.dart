import '../../domain/entities/character_details.dart';
///[Liskov Substitution Principle]
class WandModel extends Wand {
  const WandModel({
    String? wood,
    String? core,
    num? length,
  }) : super(wood: wood, core: core, length: length);

  factory WandModel.fromJson(Map<String, dynamic> json) {
    return WandModel(
        wood: json['wood'], core: json['core'], length: json['length']);
  }


  
}
