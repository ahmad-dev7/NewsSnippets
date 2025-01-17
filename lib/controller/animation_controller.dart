import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAnimationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
      duration: Durations.extralong1,
    );
    super.onInit();
  }
}
