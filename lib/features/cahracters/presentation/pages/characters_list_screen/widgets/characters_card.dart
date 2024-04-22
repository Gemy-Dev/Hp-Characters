import 'package:cached_network_image/cached_network_image.dart';
import 'package:characters_view/core/extenions/string_extension.dart';
import 'package:characters_view/core/utils/colors.dart';
import 'package:characters_view/core/utils/values.dart';
import 'package:characters_view/features/cahracters/presentation/widgets/text_utils.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/character.dart';
import '../../../widgets/handel_no_image.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: character.image ?? '',
      imageBuilder: (context, imageProvider) => 
      Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(character.image ?? ''),
            fit: BoxFit.cover,
          ),
        ),
        child: _CharacterCardDetails(character: character),
      ),
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator.adaptive()),
      errorWidget: (context, url, error) =>
          HandleNoImage(child:_CharacterCardDetails(character: character)),
    );
  }
}



class _CharacterCardDetails extends StatelessWidget {
  const _CharacterCardDetails({
  
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.all(AppPadding.p10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, AppColor.black])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextUtils(
            text: character.name.validate,
            color: AppColor.white,
          ),
          TextUtils(
            text: character.actor.validate,
            color: AppColor.orange,
          ),
          TextUtils(
            text: character.house.validate,
            color: AppColor.red,
            fontWe: FontWe.bold,
          )
        ],
      ),
    );
  }
}
