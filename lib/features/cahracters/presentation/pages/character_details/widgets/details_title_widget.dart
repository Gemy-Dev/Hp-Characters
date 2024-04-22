import 'package:characters_view/core/extenions/string_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/style.dart';
import '../../../../domain/entities/character.dart';
import '../../../widgets/text_row.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            character.name.validate,
            style: AppStyle.titleLargBold,
          ),
          const Divider(
            color: AppColor.gray,
          ),
          TextRow(leftText: 'Actor Name', rightText: character.actor.validate),
          TextRow(leftText: 'House Name', rightText: character.house.validate),
        ],
      ),
    );
  }
}
