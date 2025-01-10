import 'package:flutter/material.dart';
import 'package:news_snippets/components/my_text.dart';

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
            child: Image.asset('assets/images/logo.png', height: 40),
          ),
        ),
        title: const MyText('News Snippets'),
      ),
      //actions: const [ThemeSwitcherButton()],
    );
  }
}
