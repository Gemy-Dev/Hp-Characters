import 'package:characters_view/core/utils/colors.dart';
import 'package:characters_view/core/utils/values.dart';
import 'package:characters_view/features/cahracters/presentation/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget  implements PreferredSizeWidget{
  const CustomAppBar({super.key, required this.title, this.height=80});
final String title;
final double height;
  @override
  Widget build(BuildContext context) {
    return Container(height: height,padding: const EdgeInsets.only(top: AppPadding.p35),
      decoration: const BoxDecoration(color: AppColor.orange,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppRadius.r30,)
        ,bottomRight: Radius.circular(AppRadius.r30)))
        ,child: TextUtils(text: title,color: AppColor.white,
        textAlign: TextAlign.center,fontWe: FontWe.bold,fontSize: AppSizes.s24,)
        ,);
  
  }
  
  @override
  Size get preferredSize =>  Size(double.infinity,height);
  

}