import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../my_text.dart';

class SectionDivider extends StatelessWidget {
  final String? title;
  final Widget? leading;
  final VoidCallback onSeeAll;
  final String? label;
  const SectionDivider({
    super.key,
    this.title,
    this.label,
    required this.onSeeAll,
    this.leading,
  }) : assert(
          title != null || leading != null,
          'Either [title {String}] or [leading {Widget}] is required',
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leading ?? MyText(title!, weight: FontWeight.bold, size: 18),
          //MyButton(onTap: onSeeAll, label: label ?? 'See All')
        ],
      ),
    );
  }
}
