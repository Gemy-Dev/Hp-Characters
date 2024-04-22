

import 'package:characters_view/config/routing.dart';
import 'package:characters_view/core/extenions/failure_extionsion.dart';
import 'package:characters_view/core/extenions/routing_extinsion.dart';
import 'package:characters_view/core/utils/values.dart';
import 'package:characters_view/features/cahracters/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/characters_cubit/characters_cubit.dart';
import '../../blocs/characters_cubit/characters_state.dart';
import 'widgets/characters_card.dart';

class CharacterListScreen extends StatelessWidget {
  const CharacterListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(title: 'Characters',),
      body: BlocBuilder<CharactersCubit, CharacterListState>(
        builder: (context, state) {
          if (state is CharacterListLoading && state.isFirstFetch) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is CharacterListLoaded) {
            return  GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,childAspectRatio: .5),
                itemCount: state.characters.length,
                itemBuilder: (context, index) {
                 
                  final character = state.characters[index];
                  return InkWell(onTap: () => context.pushNamed(characterDetailsRoute,arguments: character),
                    child: Hero(tag: character.id,
                      child: Material(
                        child: CharacterCard(
                          character: character,
                        ),
                      ),
                    ),
                  );
                },
              
            );
          } else if (state is CharacterListError) {
            return Center(
              child: Icon(state.failure.icon,size: AppSizes.s30,),
            );
          } else {
            return Container(); // Or display an error message
          }
        },
      ),
    );
  }
}
