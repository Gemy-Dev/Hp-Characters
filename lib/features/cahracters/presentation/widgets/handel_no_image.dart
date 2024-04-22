import 'package:flutter/material.dart';

class HandleNoImage extends StatelessWidget {
  const HandleNoImage({
    super.key,
     this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
            image: AssetImage('assets/images/no_image.jpg'),
            fit: BoxFit.cover,
            opacity: .7),
      ),
      child: child,
    );
  }
}