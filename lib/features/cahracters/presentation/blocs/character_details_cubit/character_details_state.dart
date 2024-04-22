

import 'details.dart';

sealed class CharacterDetailsState extends Equatable {
  const CharacterDetailsState();

  @override
  List<Object> get props => [];
}

final class CharacterDetailsInitial extends CharacterDetailsState {}
final class CharacterDetailsLoading extends CharacterDetailsState {}
final class CharacterDetailsLoaded extends CharacterDetailsState {
  final CharacterDetails character;

  const CharacterDetailsLoaded({required this.character});
    @override
  List<Object> get props => [character];
}
final class CharacterDetailsError extends CharacterDetailsState {
  final String errorMsg;

 const CharacterDetailsError({required this.errorMsg});
 
  @override
  List<Object> get props => [errorMsg];
}
