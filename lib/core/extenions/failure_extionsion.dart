import 'dart:io';

import 'package:characters_view/core/errors/failures.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/String.dart';

extension FailureMsg on Failure{
  String get message{
  switch (runtimeType) {
    
      case ServerFailure:
        return serverFailure;
      case NoInternetFailure:
        return noInternet;
      default:
        return unKnown;
    }
}
  IconData get icon{
  switch (runtimeType) {
     
      case ServerFailure:
        return Platform.isIOS?CupertinoIcons.exclamationmark_triangle_fill: Icons.warning;
      case NoInternetFailure:
        return Platform.isIOS?CupertinoIcons.wifi_slash: Icons.wifi_off_outlined;
      default:
        return Platform.isIOS?CupertinoIcons.exclamationmark_circle_fill: Icons.error;
    }
}
}