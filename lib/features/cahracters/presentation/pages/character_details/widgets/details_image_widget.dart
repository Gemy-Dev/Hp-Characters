import 'package:characters_view/core/extenions/media_query_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../domain/entities/character.dart';
import '../../../widgets/network_image_handler.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.setHeight(.7),
      child: ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: [Colors.transparent, AppColor.white2],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated, // Adjust as needed
            ).createShader(bounds);
          },
          child: NetworkImageHandler(imageUrl: character.image!)),
    );
  }
}

