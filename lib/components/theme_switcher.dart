import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:day_night_themed_switch/day_night_themed_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_snippets/controller/my_controller.dart';

import '../theme/theme_data.dart';

class ThemeSwitcherButton extends StatelessWidget {
  const ThemeSwitcherButton({super.key});

  @override
  Widget build(BuildContext context) {
    var ctrl = Get.find<MyController>();
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: SizedBox(
        width: 70,
        child: ThemeSwitcher(
          builder: (context) => Obx(() => DayNightSwitch(
                value: !ctrl.isDark.value,
                onChanged: ((_) async {
                  ThemeSwitcher.of(context).changeTheme(
                    theme: _ ? MyThemeData.lightTheme : MyThemeData.darkTheme,
                    isReversed: _,
                  );
                  ctrl.isDark.value = !ctrl.isDark.value;
                  ctrl.showTopButton.value = false;
                }),
              )),
        ),
      ),
    );
  }
}
