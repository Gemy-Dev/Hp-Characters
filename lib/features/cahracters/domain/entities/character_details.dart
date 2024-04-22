import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
@immutable
abstract class CharacterDetails extends Equatable {
  final String? id;
  final String? name;
  final List<dynamic>? alternateNames;
  final String? species;
  final String? gender;
  final String? house;
  final String? dateOfBirth;
  final int? yearOfBirth;
  final bool? wizard;
  final String? ancestry;
  final String? eyeColour;
  final String? hairColour;
  final Wand? wand;
  final String? patronus;
  final bool? hogwartsStudent;
  final bool? hogwartsStaff;
  final String? actor;
  final List<String>? alternateActors;
  final bool? alive;
  final String? image;

const  CharacterDetails({
    this.id,
    this.name,
    this.alternateNames,
    this.species,
    this.gender,
    this.house,
    this.dateOfBirth,
    this.yearOfBirth,
    this.wizard,
    this.ancestry,
    this.eyeColour,
    this.hairColour,
    this.wand,
    this.patronus,
    this.hogwartsStudent,
    this.hogwartsStaff,
    this.actor,
    this.alternateActors,
    this.alive,
    this.image,
  }) ;
  
      
        @override

        List<Object?> get props => [id,
      name,
      alternateNames,
      species,
      gender,
      house,
      dateOfBirth,
      yearOfBirth,
      wizard,
      ancestry,
      eyeColour,
      hairColour,
      wand,
      patronus,
      hogwartsStudent,
      hogwartsStaff,
      actor,
      alternateActors,
      alive,
      image];


}

abstract class Wand extends Equatable {
 final String? wood;
 final String? core;
 final num? length;

const  Wand({this.wood, this.core, this.length});
  
  @override
  List<Object?> get props =>[wood,core,length];

  
}