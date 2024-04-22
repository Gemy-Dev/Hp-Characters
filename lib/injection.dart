import 'package:characters_view/core/network/network_info.dart';
import 'package:characters_view/features/cahracters/data/data_sources/remote_data_source/harry_poter_api_impl.dart';
import 'package:characters_view/features/cahracters/data/repositories_impl/characters_repo_impl.dart';
import 'package:characters_view/features/cahracters/domain/repositories/characters_repo.dart';
import 'package:characters_view/features/cahracters/domain/use_cases/get_character_details.dart';
import 'package:characters_view/features/cahracters/presentation/blocs/characters_cubit/charcters.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'features/cahracters/data/data_sources/remote_data_source/base_harry_poter_api.dart';
import 'features/cahracters/presentation/blocs/character_details_cubit/character_details_cubit.dart';

  /// Apply [Dependency Inversion Principle]
final sl = GetIt.instance;

Future<void> init() async {

  // presentation layer
  sl.registerFactory(() => CharacterDetailsCubit(  characterDetails: sl(),));
  sl.registerFactory(() => CharactersCubit(getCharactersUseCase: sl()));

//Domain Layer
  sl.registerLazySingleton(() => GetCharacterDetailsUseCase
  (charactersRepo: sl()));
  sl.registerLazySingleton(() => GetCharactersUseCase(charactersRepo: sl()));

//Data Layer
  sl.registerLazySingleton<CharactersRepo>(
      () => CharactersRepoImpl(harryPotterApi: sl(), networkInfo: sl()));

  sl.registerLazySingleton<HarryPotterApi>(
      () => HarryPotterApiImpl(client: sl()));

// Shared
  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));

  sl.registerLazySingleton(() => InternetConnectionChecker());
}
