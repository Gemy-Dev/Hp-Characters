import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension Routing on BuildContext{
  pushNamed(String route,{dynamic arguments})=>Navigator.pushNamed(this, route,arguments: arguments);
}