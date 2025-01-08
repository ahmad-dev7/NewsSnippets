import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_snippets/controller/my_controller.dart';

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    var myCtrl = Get.find<MyController>();
    return Material(
      elevation: 30,
      color: Colors.transparent,
      shadowColor: Theme.of(context).shadowColor.withOpacity(0.5),
      child: Obx(
        () => CrystalNavigationBar(
          currentIndex: myCtrl.activeIndex.value,
          onTap: (val) {
            myCtrl.showTopButton.value = false;
            myCtrl.activeIndex.value = val;
            myCtrl.pageController.value.animateToPage(
              myCtrl.activeIndex.value,
              duration: Durations.medium3,
              curve: Curves.easeInOutQuint,
            );
          },
          curve: Curves.decelerate,
          splashBorderRadius: 20,
          outlineBorderColor: Theme.of(context).colorScheme.secondary.withOpacity(.3),
          unselectedItemColor: Theme.of(context).colorScheme.secondary.withOpacity(.5),
          selectedItemColor: Theme.of(context).primaryColor,
          indicatorColor: Theme.of(context).primaryColor,
          paddingR: const EdgeInsets.symmetric(horizontal: 20),
          enableFloatingNavBar: true,
          duration: Durations.extralong2,
          margin: const EdgeInsets.all(0),
          marginR: const EdgeInsets.fromLTRB(50, 35, 50, 10),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          items: List.generate(
            3,
            (index) => CrystalNavigationBarItem(
              unselectedIcon: myCtrl.inactiveIcons[index],
              icon: myCtrl.activeIcons[index],
            ),
          ),
        ),
      ),
    );
  }
}
