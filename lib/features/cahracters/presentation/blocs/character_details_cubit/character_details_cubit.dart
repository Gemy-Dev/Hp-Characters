

import 'details.dart';

class CharacterDetailsCubit extends Cubit<CharacterDetailsState> {
  final GetCharacterDetailsUseCase _characterDetails;
  CharacterDetailsCubit( {required GetCharacterDetailsUseCase characterDetails}):_characterDetails=characterDetails
      , super(CharacterDetailsInitial());

  getCharacterDetailsById({required String id}) async {
    final result = await _characterDetails.call( id);
    result.fold(
        (failure) {
          log(failure.message);
          emit(CharacterDetailsError(errorMsg: failure.message));
        },
        (character) => emit(CharacterDetailsLoaded(character: character)));
  }
}
