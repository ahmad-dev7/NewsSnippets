import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_snippets/pages/source_page.dart';

import 'my_text.dart';

class SourceButton extends StatelessWidget {
  final String sourceName;
  final String sourceUrl;
  const SourceButton({super.key, required this.sourceName, required this.sourceUrl});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Chip(
        side: BorderSide.none,
        backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(.08),
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        labelPadding: const EdgeInsets.only(left: 5),
        visualDensity: VisualDensity.compact,
        deleteIcon: Icon(
          Icons.open_in_new_outlined,
          color: Theme.of(context).primaryColor,
          size: 20,
        ),
        onDeleted: () => Get.to(
          () => SourcePage(title: sourceName, url: sourceUrl),
          transition: Transition.downToUp,
          curve: Curves.fastEaseInToSlowEaseOut,
          duration: Durations.medium4,
        ),
        deleteButtonTooltipMessage: 'Open Source',
        padding: const EdgeInsets.all(0),
        label: MyText(
          sourceName,
          weight: FontWeight.w400,
          size: 12,
        ),
      ),
    );
  }
}
