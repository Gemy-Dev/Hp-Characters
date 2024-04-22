import 'package:characters_view/features/cahracters/presentation/blocs/characters_cubit/characters_cubit.dart';
import 'package:characters_view/features/cahracters/presentation/pages/character_details/character_details_screen.dart';
import 'package:characters_view/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/cahracters/domain/entities/character.dart';
import '../features/cahracters/presentation/blocs/character_details_cubit/character_details_cubit.dart';
import '../features/cahracters/presentation/pages/characters_list_screen/character_list_screen.dart';
 


const charactersListRoute='/';
const characterDetailsRoute='character_details_screen';
const unKnownRoute='un_known_screen';


final class AppRoute{
static Route<dynamic>?onGenerateRoute(RouteSettings route){
  switch (route.name) {

    
    case  charactersListRoute: return MaterialPageRoute(builder: (_)=>
   BlocProvider(
     create: (context) => sl<CharactersCubit>(),
     child: const CharacterListScreen(),
   ),
    );


    case  characterDetailsRoute: return MaterialPageRoute(builder: (_) {
       final args = route.arguments as Character;
      final character = args;
      return BlocProvider(
     create: (context) => sl<CharacterDetailsCubit>()..getCharacterDetailsById(id: args.id),
     child:  CharacterDetailsScreen(character: character,),
       );
    },
    );
      
    
    default:
    return MaterialPageRoute(builder: (_)=>const Scaffold(body: Center(child: Text('Unknown')),));
  }

}
}