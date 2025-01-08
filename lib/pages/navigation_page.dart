import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_snippets/components/my_app_bar.dart';
import 'package:news_snippets/components/navigation_bar.dart';
import 'package:news_snippets/controller/my_controller.dart';
import 'package:news_snippets/package/scroll_to_hide.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    var ctrl = Get.find<MyController>();
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.maxFinite, 65),
          child: MyAppBar(),
        ),
        body: Obx(() {
          if (ctrl.pageController.value.hasClients && ctrl.pageController.value.page != 0) {
            ctrl.pageController.value = PageController(initialPage: ctrl.activeIndex.value);
          }
          return PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: ctrl.pageController.value,
            children: ctrl.pages,
          );
        }),
        extendBody: true,
        bottomNavigationBar: Obx(
          () => ScrollToHide(
            duration: Durations.medium2,
            hideDirection: Axis.vertical,
            scrollController: ctrl.scrollController.value,
            child: const MyNavigationBar(),
          ),
        ),
      ),
    );
  }
}
