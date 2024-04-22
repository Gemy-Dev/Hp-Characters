import 'package:flutter/material.dart';

class NetworkImageHandler extends StatelessWidget {
  const NetworkImageHandler({super.key,required this.imageUrl});
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return
    Image.network(
                  imageUrl,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    final totalBytes = loadingProgress?.expectedTotalBytes;
                    final bytesLoaded =
                        loadingProgress?.cumulativeBytesLoaded;
                    if (totalBytes != null && bytesLoaded != null) {
                      return CircularProgressIndicator.adaptive(
                        backgroundColor: Colors.white70,
                        value: bytesLoaded / totalBytes,
                        //valueColor: Colors.blue[900],
                        strokeWidth: 5.0,
                      );
                    } else {
                      return child;
                    }
                  },
                  frameBuilder: (BuildContext context, Widget child,
                      int? frame, bool wasSynchronouslyLoaded) {
                    if (wasSynchronouslyLoaded) {
                      return child;
                    }
                    return AnimatedOpacity(
                      opacity: frame == null ? 0 : 1,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeOut,
                      child: child,
                    );
                  },width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
         
                   return Image.asset('assets/images/no_image.jpg',fit: BoxFit.cover,);
                  },
                  
                );
  }
}