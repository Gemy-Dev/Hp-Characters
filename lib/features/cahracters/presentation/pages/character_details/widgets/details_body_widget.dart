import 'dart:io';

import 'package:characters_view/core/extenions/string_extension.dart';
import 'package:characters_view/features/cahracters/presentation/widgets/text_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/values.dart';
import '../../../../../../injection.dart';
import '../../../blocs/character_details_cubit/character_details_cubit.dart';
import '../../../blocs/character_details_cubit/details.dart';

class CharacterDetailsBody extends StatefulWidget {
  const CharacterDetailsBody({super.key, required this.id});
final String id;

  @override
  State<CharacterDetailsBody> createState() => _CharacterDetailsBodyState();
}

class _CharacterDetailsBodyState extends State<CharacterDetailsBody> {
  final bloc = sl<CharacterDetailsCubit>();
  @override
  void initState() {
    bloc.getCharacterDetailsById(id: widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
                              padding: const EdgeInsets.all(AppPadding.p10),
                              decoration: const BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(AppRadius.r30),
                                      topRight: Radius.circular(AppRadius.r30))),
                              child: BlocBuilder<CharacterDetailsCubit,
                                  CharacterDetailsState>(
                                builder: (context, state) {
                                  if (state is CharacterDetailsLoading) {
                                    return const Center(
                                      child: CircularProgressIndicator
                                          .adaptive(),
                                    );
                                  } else if (state
                                      is CharacterDetailsLoaded) {
                                    final details = state.character;
                                    return Column(
                                      children: [
                                        ...characterDetails(details)
                                            .entries
                                            .map((item) => Column(
                                                  children: [
                                                    TextRow(
                                                      leftText: item.key,
                                                      rightText: item.value,
                                                    ),
                                                    const Divider(
                                                      color: AppColor.gray,
                                                    )
                                                  ],
                                                ))
                                            .toList(),
                                      ],
                                    );
                                  } else if (state is CharacterDetailsError)
                                    // ignore: curly_braces_in_flow_control_structures
                                    return Center(
                                      child: Icon(Platform.isIOS
                                          ? CupertinoIcons.info
                                          : Icons.info),
                                    );
                                  return const Center(
                                    child:
                                        CircularProgressIndicator.adaptive(),
                                  );
                                },
                                    ))  ;
  }

   Map<String, dynamic> characterDetails(CharacterDetails character) => {
        'Alternate Names': character.alternateNames?.join(', ') ?? 'N/A',
        'Gender': character.gender.validate,
        'Date of Birth': character.dateOfBirth.validate,
        'Year of Birth': character.yearOfBirth ?? 'Unknown',
        'Wizard': character.wizard ?? 'Unknown',
        'Ancestry': character.ancestry.validate,
        'Eye Colour': character.eyeColour.validate,
        'Hair Colour': character.hairColour.validate,
        'Wand':
            'wood: ${character.wand?.wood.validate} \ncore: ${character.wand?.core.validate}\nlength: ${character.wand?.length ?? 'n/a'}',
        'Patronus': character.patronus.validate,
        'Hogwarts Student': character.hogwartsStudent ?? 'Unknown',
        'Hogwarts Staff': character.hogwartsStaff ?? 'Unknown',
        'Alternate Actors': character.alternateActors?.join(', ') ?? 'N/A',
        'Alive': character.alive ?? 'Unknown',
      };
}