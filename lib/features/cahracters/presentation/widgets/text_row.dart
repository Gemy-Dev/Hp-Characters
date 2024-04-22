import 'package:characters_view/core/extenions/media_query_extension.dart';
import 'package:characters_view/features/cahracters/presentation/widgets/text_utils.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class TextRow extends StatelessWidget {
  const TextRow({
    super.key,
    required this.leftText,
    required this.rightText,
  });
  final String leftText;
  final dynamic rightText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextUtils(
        text:  '$leftText :  ',
          color: AppColor.black,fontWe: FontWe.bold,
        ),SizedBox(  width: context.fullWidth() / 2.5,
          child: TextUtils(text: rightText.toString(),color: AppColor.red,fontWe: FontWe.bold,)),
        
      ],
    );
  }
}
