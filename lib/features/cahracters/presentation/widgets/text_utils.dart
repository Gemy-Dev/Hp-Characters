import 'package:characters_view/core/utils/colors.dart';
import 'package:flutter/material.dart';


enum FontWe { bold, medium, regular, semiBold }

class TextUtils extends StatelessWidget {
  const TextUtils({
    super.key,
    required this.text,
    this.fontSize = 16.0,
    this.color,
    this.fontWe = FontWe.regular,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.softWrap,
    this.decoration,
  });

  final String text;
  final double fontSize;
  final Color? color;
  final FontWe fontWe;
  final TextAlign textAlign;
  final int? maxLines;
  final bool? softWrap;

  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        fontSize: fontSize,
        color: color ?? AppColor.black,
        fontWeight: _fontWeight(),
        decoration: decoration,
      ),
      textAlign: textAlign,
      maxLines: maxLines ?? 3,
      overflow: TextOverflow.ellipsis,
      softWrap: softWrap ?? true,
    );
  }

 

  _fontWeight() {
    switch (fontWe) {
      case FontWe.bold:
        return FontWeight.w700;
      case FontWe.semiBold:
        return FontWeight.w400;
      case FontWe.medium:
        return FontWeight.w500;
      case FontWe.regular:
        return FontWeight.w400;
    }
  }
}
