import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_snippets/components/my_text.dart';
import 'package:news_snippets/components/theme_switcher.dart';
import 'package:news_snippets/controller/my_controller.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 65,
      surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: ListTile(
        contentPadding: const EdgeInsets.all(0),
        horizontalTitleGap: 8,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Material(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            elevation: 20,
            child: Image.asset('assets/images/app_logo.png', height: 40, width: 40),
          ),
        ),
        title: const MyText('News Snippets'),
      ),
      actions: [
        Obx(
          () => Visibility(
            visible: Get.find<MyController>().activeIndex.value == 2,
            child: const ThemeSwitcherButton(),
          ),
        ),
      ],
    );
  }
}
