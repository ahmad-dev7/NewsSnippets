import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_snippets/controller/my_controller.dart';
import 'package:news_snippets/pages/navigation_page.dart';
import 'package:news_snippets/theme/theme_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut(() => MyController(), fenix: true);
  runApp(const NewsSnippets());
}

class NewsSnippets extends StatelessWidget {
  const NewsSnippets({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: MyThemeData.darkTheme,
      builder: (context, theme) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News Snippets',
        theme: theme,
        home: const NavigationPage(),
      ),
    );
  }
}
