import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:news_snippets/controller/animation_controller.dart';
import 'package:news_snippets/controller/my_controller.dart';

class GoToTop extends StatelessWidget {
  const GoToTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedOpacity(
        opacity: Get.find<MyController>().showTopButton.value ? 1 : 0,
        duration: Durations.medium1,
        child: Padding(
          padding: const EdgeInsets.all(60),
          child: FloatingActionButton(
            onPressed: Get.find<MyController>().goToTop,
            backgroundColor: Theme.of(context).primaryColor,
            mini: true,
            child: const Icon(Icons.arrow_circle_up, color: Colors.white),
          ).animate(controller: Get.find<MyAnimationController>().animationController).slideY(),
        ),
      ),
    );
  }
}
