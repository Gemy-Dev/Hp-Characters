


import 'package:characters_view/core/utils/usecase.dart';

import 'charcters.dart';

class CharactersCubit extends Cubit<CharacterListState> {
  final GetCharactersUseCase getCharactersUseCase;

  CharactersCubit({required this.getCharactersUseCase})
      : super(CharacterListInitial()) {
    // to fetch characters when cubit is initialize
    fetchCharacters();
  }

  void fetchCharacters() async {
    emit(const CharacterListLoading(isFirstFetch: true));

    final result = await getCharactersUseCase.call(NoInput());

    result.fold((failure) => emit(CharacterListError(failure)),
        (characters) {
      emit(CharacterListLoaded(characters,));
    });
  }




 
 
 
}
