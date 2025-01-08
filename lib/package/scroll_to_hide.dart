import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_snippets/controller/my_controller.dart';

class ScrollToHide extends StatelessWidget {
  final ScrollController scrollController;
  final Widget child;
  final Duration duration;
  final Axis hideDirection;
  final double? height;
  final double? width;
  const ScrollToHide({
    super.key,
    required this.scrollController,
    required this.child,
    required this.duration,
    required this.hideDirection,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    var ctrl = Get.put(MyController());
    return Obx(
      () {
        var show = ctrl.isScrollToHideShown.value;
        return AnimatedContainer(
          duration: duration,
          height: hideDirection == Axis.vertical ? (show ? 115 : 0) : height,
          width: hideDirection == Axis.horizontal ? (show ? width : 0) : width,
          curve: Curves.linear,
          clipBehavior: Clip.none,
          child: Wrap(
            children: [child],
          ),
        );
      },
    );
  }
}
