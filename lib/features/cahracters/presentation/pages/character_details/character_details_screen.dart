import 'package:characters_view/core/extenions/media_query_extension.dart';
import 'package:characters_view/core/utils/values.dart';
import 'package:characters_view/features/cahracters/domain/entities/character.dart';
import 'package:characters_view/features/cahracters/presentation/pages/character_details/widgets/details_body_widget.dart';
import 'package:flutter/material.dart';
import 'widgets/details_image_widget.dart';
import 'widgets/details_title_widget.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailsScreen({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ImageWidget(character: character),
                  const SizedBox(height: AppSizes.s15),
                  Column(
                    children: [
                      SizedBox(
                        height: context.setHeight(.5),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleWidget(character: character),
                            CharacterDetailsBody(id: character.id)
                          ]),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
