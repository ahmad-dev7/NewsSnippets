import 'package:flutter/material.dart';
import 'package:news_snippets/components/theme_switcher.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Bookmark Page'),
            SizedBox(height: 20),
            ThemeSwitcherButton(),
          ],
        ),
      ),
    );
  }
}
