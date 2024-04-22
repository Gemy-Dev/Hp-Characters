
import 'charcters.dart';

sealed class CharacterListState extends Equatable {
  const CharacterListState();
  @override
  List<Object> get props => [];
}

final class CharacterListInitial extends CharacterListState {}


final class CharacterListLoading extends CharacterListState {
  final bool isFirstFetch;
  const CharacterListLoading({this.isFirstFetch = false});

  @override
  List<Object> get props => [isFirstFetch];
}



final class CharacterListLoaded extends CharacterListState {
  final List<Character> characters;

  const CharacterListLoaded(this.characters,);
  @override
  List<Object> get props => [characters,];

  
  
}

final class CharacterListError extends CharacterListState {
final Failure failure;

  const CharacterListError(this.failure);

  @override
  List<Object> get props => [failure];
}
