import 'package:flutter/cupertino.dart';

class CustomCupertinoPageRoute<T> extends CupertinoPageRoute<T> {
  final Duration duration;
  CustomCupertinoPageRoute({required super.builder, required this.duration});

  @override
  Duration get transitionDuration => duration;
}
