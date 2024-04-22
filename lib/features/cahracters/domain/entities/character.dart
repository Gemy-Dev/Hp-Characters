import 'package:equatable/equatable.dart';

abstract class Character extends Equatable{

final String id;
final String? name;
final String? actor;
final String? house;
final String? image;

const  Character({required this.id,  this.name,  this.actor,  this.house,this.image});



  @override
  List<Object?> get props => [id,name,actor,house,image];

}